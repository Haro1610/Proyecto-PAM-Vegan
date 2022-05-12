import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planternativo/auth/bloc/auth_bloc.dart';
import 'package:planternativo/perfil/perfil.dart';
import 'package:planternativo/recetaEsp/recetaEsp.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:planternativo/recetas/bloc/crear_bloc.dart';

import 'bloc/pending_bloc.dart';

class Platillo extends StatelessWidget {
  int stars = 6;
  String name = "Pozole";
  String author = "Juan";
  String ingredients = "Chile";
  String image = "";
  String description = "Echale mucho";

  Platillo(int stars, String name, String author, String ingredients,
      String image, String description, bool perfil) {
    this.stars = stars;
    this.name = name;
    this.author = author;
    this.ingredients = ingredients;
    this.image = image;
    this.description = description;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RecetasEsp(
              {
                "stars": stars,
                "name": name,
                "author": author,
                "ingredients": ingredients,
                "image": image,
                "description": description
              },
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        elevation: 6.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(name,
                            style: GoogleFonts.pacifico(
                              textStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text("Autor: " + author,
                            style: GoogleFonts.overpass(
                              textStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 15.0,
                              ),
                            )),
                        SizedBox(
                          height: 3.0,
                        ),
                        RatingBarIndicator(
                          rating: stars.toDouble(),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          itemCount: 5,
                          itemSize: 25.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        //TENEMOS QUE PONER UN BLOC QUE BORRE LA RECETA
                      },
                      icon: Icon(Icons.delete),
                      color: Color.fromARGB(255, 191, 62, 52),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Recetas extends StatelessWidget {
  TextEditingController _titulo = new TextEditingController();
  TextEditingController _ingredientes = new TextEditingController();
  TextEditingController _procedimiento = new TextEditingController();
  TextEditingController _search = new TextEditingController();
  var _imagen;
  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 158, 242, 183),
            Color.fromARGB(255, 37, 138, 56)
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Color.fromARGB(255, 1, 61, 3),
            width: _screen.width,
            height: 100,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Perfil()));
                        },
                        icon: Icon(Icons.account_circle_rounded),
                        color: Colors.green,
                      ),
                      Text(
                        "Planternativo",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(SingOutEvent());
                        },
                        icon: Icon(Icons.logout),
                        color: Colors.green,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Text(
            "Recetas de la semana",
            style: GoogleFonts.pacifico(
              textStyle: TextStyle(
                fontSize: 30.0,
                color: Color.fromARGB(255, 17, 88, 19),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            child: TextField(
              controller: _search,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Buscar una receta",
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (_) => AlertDialog(
                  title: Text(
                    "Nueva receta",
                    style: GoogleFonts.pacifico(
                      textStyle: TextStyle(
                        fontSize: 30.0,
                        color: Color.fromARGB(255, 17, 88, 19),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  content: Wrap(
                    runSpacing: 18,
                    spacing: 18,
                    children: [
                      TextField(
                        controller: _titulo,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Titulo",
                        ),
                      ),
                      TextField(
                        controller: _ingredientes,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Ingredientes",
                        ),
                      ),
                      TextField(
                        controller: _procedimiento,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Procedimiento",
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () async {
                                _imagen = await _pickImage();
                                //_imagen debe guardarse en firebase
                              },
                              child: Text("Elegir imagen")),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    Wrap(
                      children: [
                        TextButton(
                          onPressed: () {
                            Map<String, dynamic> recetaMapa = {};
                            recetaMapa = {
                              "nombre": _titulo.value.text,
                              "ingredientes": _ingredientes.value.text,
                              "procedimiento": _procedimiento.value.text,
                              "imagen": _imagen,
                            };
                            BlocProvider.of<CrearBloc>(context).add(
                                OnCrearSaveDataEvent(dataToSave: recetaMapa));

                            //Este bloc no funciona bien, no se actualiza la lista de recetas al crear una nueva.
                            BlocProvider.of<PendingBloc>(context)
                                .add(GetRecetasEvent());
                            Navigator.pop(context, 'Cancelar');
                          },
                          child: Text(
                            "Aceptar",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'Cancelar');
                          },
                          child: Text(
                            "Cancelar",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              elevation: 6.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("Agregar receta",
                              style: GoogleFonts.pacifico(
                                textStyle: TextStyle(
                                  color: Colors.green,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(
                            height: 3.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: null,
              height: 0,
              child: BlocConsumer<PendingBloc, PendingState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is PendingFotosLoadingState) {
                    return ListView.builder(
                      itemCount: 25,
                      itemBuilder: (BuildContext context, int index) {
                        return YoutubeShimmer();
                      },
                    );
                  } else if (state is PendingFotosEmptyState) {
                    return Center(
                      child: Text("No hay datos por mostrar"),
                    );
                  } else if (state is PendingFotosSuccessState) {
                    return ListView.builder(
                      itemCount: state.myData.length,
                      itemBuilder: (BuildContext context, int index) {
                        var stars = state.myData[index]['stars'];
                        var nombre = state.myData[index]['nombre'];
                        var autor = state.myData[index]['autor'];
                        var ingredientes = state.myData[index]['ingredientes'];
                        var imagen = state.myData[index]['imagen'];
                        var procedimiento =
                            state.myData[index]['procedimiento'];

                        return Platillo(stars, nombre, autor, ingredientes,
                            imagen, procedimiento, false);
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<File?> _pickImage() async {
    final picker = ImagePicker();
    final XFile? chosenImage = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    return chosenImage != null ? File(chosenImage.path) : null;
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../recetaEsp/recetaEsp.dart';

class Perfil extends StatefulWidget {
  Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => PerfilState();
}

class Platillo extends StatelessWidget {
  int stars = 6;
  String name = "Pozole";
  String author = "Iñaki";

  Platillo(int stars, String name, String author) {
    this.stars = stars;
    this.name = name;
    this.author = author;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RecetasEsp()));
        /*
        BlocProvider.of<TimeBloc>(context).pais = PlatilloName;
        BlocProvider.of<TimeBloc>(context).add(TimeGet());
        BlocProvider.of<ImageBloc>(context).add(ImageGet());
        BlocProvider.of<FraseBloc>(context).add(FraseGet());*/
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
                child: Column(
                  children: [
                    Text(name,
                        style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                            color: Color.fromARGB(255, 93, 144, 100),
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
                            color: Color.fromARGB(255, 93, 144, 100),
                            fontSize: 15.0,
                          ),
                        )),
                    SizedBox(
                      height: 3.0,
                    ),
                    _CountStars(stars),
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

class PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    File? _imagenPerfil;
    bool _imageCon = true;
    String _recetasCant = "1200";
    String _autor = "Iñaki Orozco";
    return Scaffold(
      body: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(255, 35, 129, 13),
                    Color.fromARGB(255, 93, 144, 100)
                  ])),
              height: MediaQuery.of(context).size.height,
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                width: double.infinity,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          setState(() async {
                            _imageCon = false;
                            _imagenPerfil = await _pickImage();
                          });
                        },
                        child: CircleAvatar(
                          backgroundImage: _imageCon
                              ? NetworkImage(
                                  "https://islam.ru/en/sites/default/files/img/story/2014/02/red-fox2.jpg")
                              : _imagenPerfil as ImageProvider,
                          radius: 50.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(_autor,
                          style: GoogleFonts.overpass(
                            textStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.green,
                        elevation: 8.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text("Recetas",
                                        style: GoogleFonts.overpass(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(_recetasCant,
                                        style: GoogleFonts.overpass(
                                          textStyle: TextStyle(
                                            fontSize: 19.0,
                                            color: Colors.white,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * .65,
                          child: ListView(
                              scrollDirection: Axis.vertical,
                              children: [
                                Platillo(3, "Tacos", "Iñaki"),
                                Platillo(4, "Pozole", "Iñaki"),
                                Platillo(5, "Chimichangas", "Iñaki"),
                                Platillo(6, "Gorditas", "Iñaki"),
                                Platillo(0, "Ratatouille", "Iñaki"),
                              ])),
                    ],
                  ),
                ),
              )),
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

Row _CountStars(int stars) {
  var starFull = Icon(
    Icons.star,
    color: Color.fromARGB(255, 93, 144, 100),
    size: 24.0,
    semanticLabel: 'Text to announce in accessibility modes',
  );
  var starEmpty = Icon(
    Icons.star_border_outlined,
    color: Color.fromARGB(255, 93, 144, 100),
    size: 24.0,
    semanticLabel: 'Text to announce in accessibility modes',
  );
  var starGray = Icon(
    Icons.star_border_outlined,
    color: Colors.grey,
    size: 24.0,
    semanticLabel: 'Text to announce in accessibility modes',
  );
  switch (stars) {
    case 0:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [starEmpty, starEmpty, starEmpty, starEmpty, starEmpty],
      );
    case 1:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [starFull, starEmpty, starEmpty, starEmpty, starEmpty],
      );
    case 2:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [starFull, starFull, starEmpty, starEmpty, starEmpty],
      );
    case 3:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [starFull, starFull, starFull, starEmpty, starEmpty],
      );
    case 4:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [starFull, starFull, starFull, starFull, starEmpty],
      );
    case 5:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [starFull, starFull, starFull, starFull, starFull],
      );
    default:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [starGray, starGray, starGray, starGray, starGray],
      );
  }
}

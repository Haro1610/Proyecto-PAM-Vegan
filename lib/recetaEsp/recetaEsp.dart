import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:planternativo/perfil/perfil.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../auth/bloc/auth_bloc.dart';

class Stars {
  bool rated = false;

  int _updateStars(int stars) {
    print(rated);
    if (!rated) {
      rated = true;
      //aquí debemos actualizar la información sumando a las estrellas de la receta y luego promediando entre todas las calificaciones
      return stars;
    }

    return -1;
  }

  Row _countStars(int stars) {
    var starFull = Icon(
      Icons.star,
      color: Colors.white,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    );
    var starEmpty = Icon(
      Icons.star_border_outlined,
      color: Colors.white,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    );
    var starGray = Icon(
      Icons.star,
      color: Color.fromARGB(255, 92, 92, 92),
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    );
    switch (stars) {
      case 0:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  _updateStars(1);
                },
                child: starEmpty),
            GestureDetector(
                onTap: () {
                  _updateStars(2);
                },
                child: starEmpty),
            GestureDetector(
                onTap: () {
                  _updateStars(3);
                },
                child: starEmpty),
            GestureDetector(
                onTap: () {
                  _updateStars(4);
                },
                child: starEmpty),
            GestureDetector(
                onTap: () {
                  _updateStars(5);
                },
                child: starEmpty)
          ],
        );
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  _updateStars(1);
                },
                child: starFull),
            GestureDetector(
                onTap: () {
                  _updateStars(2);
                },
                child: starEmpty),
            GestureDetector(
                onTap: () {
                  _updateStars(3);
                },
                child: starEmpty),
            GestureDetector(
                onTap: () {
                  _updateStars(4);
                },
                child: starEmpty),
            GestureDetector(
                onTap: () {
                  _updateStars(5);
                },
                child: starEmpty)
          ],
        );
      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  _updateStars(1);
                },
                child: starFull),
            GestureDetector(
                onTap: () {
                  _updateStars(2);
                },
                child: starFull),
            GestureDetector(
                onTap: () {
                  _updateStars(3);
                },
                child: starEmpty),
            GestureDetector(
                onTap: () {
                  _updateStars(4);
                },
                child: starEmpty),
            GestureDetector(
                onTap: () {
                  _updateStars(5);
                },
                child: starEmpty)
          ],
        );
      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  _updateStars(1);
                },
                child: starFull),
            GestureDetector(
                onTap: () {
                  _updateStars(2);
                },
                child: starFull),
            GestureDetector(
                onTap: () {
                  _updateStars(3);
                },
                child: starFull),
            GestureDetector(
                onTap: () {
                  _updateStars(4);
                },
                child: starEmpty),
            GestureDetector(
                onTap: () {
                  _updateStars(5);
                },
                child: starEmpty)
          ],
        );
      case 4:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  _updateStars(1);
                },
                child: starFull),
            GestureDetector(
                onTap: () {
                  _updateStars(2);
                },
                child: starFull),
            GestureDetector(
                onTap: () {
                  _updateStars(3);
                },
                child: starFull),
            GestureDetector(
                onTap: () {
                  _updateStars(4);
                },
                child: starFull),
            GestureDetector(
                onTap: () {
                  _updateStars(5);
                },
                child: starEmpty)
          ],
        );
      case 5:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  _updateStars(1);
                },
                child: starFull),
            GestureDetector(
                onTap: () {
                  _updateStars(2);
                },
                child: starFull),
            GestureDetector(
                onTap: () {
                  _updateStars(3);
                },
                child: starFull),
            GestureDetector(
                onTap: () {
                  _updateStars(4);
                },
                child: starFull),
            GestureDetector(
                onTap: () {
                  _updateStars(5);
                },
                child: starFull)
          ],
        );
      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  _updateStars(1);
                },
                child: starGray),
            GestureDetector(
                onTap: () {
                  _updateStars(2);
                },
                child: starGray),
            GestureDetector(
                onTap: () {
                  _updateStars(3);
                },
                child: starGray),
            GestureDetector(
                onTap: () {
                  _updateStars(4);
                },
                child: starGray),
            GestureDetector(
                onTap: () {
                  _updateStars(5);
                },
                child: starGray),
          ],
        );
    }
  }
}

class RecetasEsp extends StatelessWidget {
  var starsInstance = Stars();
  RecetasEsp(this.data);
  final Map<String, dynamic> data;
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightGreen,
              Colors.blueAccent,
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    leading: Image.network(
                        "https://mui.kitchen/__export/1627825762891/sites/muikitchen/img/2021/08/01/pollo-al-horno-con-limon.jpg_1778406236.jpg"),
                    title: const Text('Pollo asado'),
                    subtitle: Text(
                      'por Anasofia',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const Text(
                        "Ingredientes",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Column(
                      children: [
                        starsInstance._countStars(data["stars"]),
                        Container(
                          height: 200,
                          width: 200,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                              data["image"],
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                      ],
                    )
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Proceso:",
                    style: GoogleFonts.pacifico(
                        textStyle: TextStyle(
                            color: Color.fromARGB(255, 1, 52, 3),
                            fontSize: 20)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: _screen.width * 0.95,
                    height: _screen.height * 0.4,
                    child: Card(
                      shape: null,
                      elevation: 6,
                      child: Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(data["description"],
                                  style: GoogleFonts.overpass())),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Preparacion"),
                      Text("-Mezcle las especias y limon en un recipiente"),
                      Text("-Frote al pollo con la mezcla"),
                      Text("-Deje reposar por dos horas"),
                      Text(
                          "-Introducir al horno a 80 grados centigrados por una hora"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future _storeAndShare(Uint8List bytes) async {
    ///Store Plugin
    print("hola");
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = await File('${directory.path}/img.png').create();
    await imagePath.writeAsBytes(bytes);
    print(imagePath);

    /// Share Plugin
    await Share.shareFiles([imagePath.path]);
  }
}

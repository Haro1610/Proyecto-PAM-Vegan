import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planternativo/perfil/perfil.dart';

import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../auth/bloc/auth_bloc.dart';

class RecetasEsp extends StatelessWidget {
  RecetasEsp(this.data);
  final Map<String, dynamic> data;
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
    return Material(
      child: Screenshot(
        controller: screenshotController,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 128, 185, 63),
                Color.fromARGB(255, 5, 139, 34)
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
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        double pixelRatio =
                            MediaQuery.of(context).devicePixelRatio;
                        _storeAndShare((await screenshotController.capture(
                            pixelRatio: pixelRatio))!);
                      },
                      icon: Icon(
                        Icons.share,
                        color: Color.fromARGB(255, 2, 54, 4),
                      )),
                  Text(
                    data["name"],
                    style: GoogleFonts.pacifico(
                        textStyle: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 2, 54, 4),
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      width: _screen.width * 0.45,
                      height: _screen.height * 0.3,
                      child: Card(
                        shape: null,
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Expanded(
                            flex: 1,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(data["ingredients"],
                                  style: GoogleFonts.overpass(
                                      textStyle: TextStyle(
                                    fontSize: 12,
                                  ))),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        _CountStars(data["stars"]),
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
                  ),
                ],
              )
            ],
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

Row _CountStars(int stars) {
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
                print("1");
              },
              child: starEmpty),
          GestureDetector(
              onTap: () {
                print("2");
              },
              child: starEmpty),
          GestureDetector(
              onTap: () {
                print("3");
              },
              child: starEmpty),
          GestureDetector(
              onTap: () {
                print("4");
              },
              child: starEmpty),
          GestureDetector(
              onTap: () {
                print("5");
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
                print("1");
              },
              child: starFull),
          GestureDetector(
              onTap: () {
                print("2");
              },
              child: starEmpty),
          GestureDetector(
              onTap: () {
                print("3");
              },
              child: starEmpty),
          GestureDetector(
              onTap: () {
                print("4");
              },
              child: starEmpty),
          GestureDetector(
              onTap: () {
                print("5");
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
                print("1");
              },
              child: starFull),
          GestureDetector(
              onTap: () {
                print("2");
              },
              child: starFull),
          GestureDetector(
              onTap: () {
                print("3");
              },
              child: starEmpty),
          GestureDetector(
              onTap: () {
                print("4");
              },
              child: starEmpty),
          GestureDetector(
              onTap: () {
                print("5");
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
                print("1");
              },
              child: starFull),
          GestureDetector(
              onTap: () {
                print("2");
              },
              child: starFull),
          GestureDetector(
              onTap: () {
                print("3");
              },
              child: starFull),
          GestureDetector(
              onTap: () {
                print("4");
              },
              child: starEmpty),
          GestureDetector(
              onTap: () {
                print("5");
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
                print("1");
              },
              child: starFull),
          GestureDetector(
              onTap: () {
                print("2");
              },
              child: starFull),
          GestureDetector(
              onTap: () {
                print("3");
              },
              child: starFull),
          GestureDetector(
              onTap: () {
                print("4");
              },
              child: starFull),
          GestureDetector(
              onTap: () {
                print("5");
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
                print("1");
              },
              child: starFull),
          GestureDetector(
              onTap: () {
                print("2");
              },
              child: starFull),
          GestureDetector(
              onTap: () {
                print("3");
              },
              child: starFull),
          GestureDetector(
              onTap: () {
                print("4");
              },
              child: starFull),
          GestureDetector(
              onTap: () {
                print("5");
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
                print("1");
              },
              child: starGray),
          GestureDetector(
              onTap: () {
                print("2");
              },
              child: starGray),
          GestureDetector(
              onTap: () {
                print("3");
              },
              child: starGray),
          GestureDetector(
              onTap: () {
                print("4");
              },
              child: starGray),
          GestureDetector(
              onTap: () {
                print("5");
              },
              child: starGray),
        ],
      );
  }
}

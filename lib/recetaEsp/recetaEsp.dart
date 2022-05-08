import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planternativo/perfil/perfil.dart';

import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../auth/bloc/auth_bloc.dart';

class RecetasEsp extends StatelessWidget {
  ScreenshotController screenshotController = ScreenshotController();
  int _numberOfStars = -1;
  String _titulo = "Hamburguesa Vegana";
  String _descripcion =
      "La receta de la hamburguesa vegana se comienza triturando muy bien las lentejas previamente cocidas de manera tal que quede una consistencia pastosa.\n Una vez procesadas, mezcla las lentejas con el perejil, la zanahoria el ajo y el ajo y el pan rallado. Asegúrate de que todos los ingredientes se encentren bien integrados. Posteriormente, lleva la mezcla a la heladera durante media hora.\n Pasado el tiempo recomendado, retira la mezcla de la nevera y sepárala en porciones. Cada porción, debes amasarla, hacer pequeñas bolas y luego aplastarlas de manera que queden en la misma forma que una carne de hamburguesas.\n Luego debes pasarla por pan rallado y en un sartén con poco aceite para terminar de darles la consistencia adecuada. Ahora corta los panes de hamburguesa y rellena cada uno con las ruedas de lentejas, acompañadas por tomate, lechuga, cebolla y todos los vegetales que requieres. ¡Ya están listas para servir! ¡Buen provecho! JFDLASÑJDFASLJFASÑLJFAKSÑJFASKÑFJKADSLKFJASÑFJASKÑLJFDASÑLFJDASKÑLFKJADSÑFJASDFKJASDÑFJASKÑFJASDKFÑASJFÑASDJFÑASDJFASJ Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  String _ingredientes =
      "* ¼ kg de lentejas cocidas \n* 2 cucharadas de perejil picado \n* 1 diente de ajo pisado \n* 4 cucharadas de zanahoria rallada muy fina \n* 2 cucharadas de cebolla rehogada \n* 4 cucharadas de galletas de salvado molidas o pan rallado \n* Aceite de oliva \n* Pan rallado";
  String _imagen =
      "https://www.sabrosia.pr/resizer/U8dw60E4ucVskb2IH5vRcWVWlvw=/1440x0/filters:format(jpg):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/metroworldnews/JDPCVRO6AFGATNQHEVA4EFZCTA.jpg";
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
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                  Text(
                    _titulo,
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
                              child: Text(_ingredientes,
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
                        _CountStars(_numberOfStars),
                        Container(
                          height: 200,
                          width: 200,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                              _imagen,
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
                              child: Text(_descripcion,
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

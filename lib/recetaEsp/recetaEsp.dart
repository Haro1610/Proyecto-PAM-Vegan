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
  RecetasEsp(this.data);
  final Map<String, dynamic> data;
  ScreenshotController screenshotController = ScreenshotController();
  /*int _numberOfStars = data["stars"];
  String _titulo = "Hamburguesa Vegana";
  String _descripcion =
      "La receta de la hamburguesa vegana se comienza triturando muy bien las lentejas previamente cocidas de manera tal que quede una consistencia pastosa.\n Una vez procesadas, mezcla las lentejas con el perejil, la zanahoria el ajo y el ajo y el pan rallado. Asegúrate de que todos los ingredientes se encentren bien integrados. Posteriormente, lleva la mezcla a la heladera durante media hora.\n Pasado el tiempo recomendado, retira la mezcla de la nevera y sepárala en porciones. Cada porción, debes amasarla, hacer pequeñas bolas y luego aplastarlas de manera que queden en la misma forma que una carne de hamburguesas.\n Luego debes pasarla por pan rallado y en un sartén con poco aceite para terminar de darles la consistencia adecuada. Ahora corta los panes de hamburguesa y rellena cada uno con las ruedas de lentejas, acompañadas por tomate, lechuga, cebolla y todos los vegetales que requieres. ¡Ya están listas para servir! ¡Buen provecho! JFDLASÑJDFASLJFASÑLJFAKSÑJFASKÑFJKADSLKFJASÑFJASKÑLJFDASÑLFJDASKÑLFKJADSÑFJASDFKJASDÑFJASKÑFJASDKFÑASJFÑASDJFÑASDJFASJ Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  String _ingredientes =
      "* ¼ kg de lentejas cocidas \n* 2 cucharadas de perejil picado \n* 1 diente de ajo pisado \n* 4 cucharadas de zanahoria rallada muy fina \n* 2 cucharadas de cebolla rehogada \n* 4 cucharadas de galletas de salvado molidas o pan rallado \n* Aceite de oliva \n* Pan rallado";
  String _imagen =
      "https://www.sabrosia.pr/resizer/U8dw60E4ucVskb2IH5vRcWVWlvw=/1440x0/filters:format(jpg):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/metroworldnews/JDPCVRO6AFGATNQHEVA4EFZCTA.jpg";
*/
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
                    Container(
                      height: 100,
                      width: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("-Un pollo"),
                          Text("-Sazonador"),
                          Text("-Limon"),
                          Text("-Especias"),
                          Text("-Adobo"),
                        ],
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
}

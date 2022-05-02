import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:planternativo/auth/bloc/auth_bloc.dart';
import 'package:planternativo/login/login.dart';
import 'package:planternativo/perfil/perfil.dart';
import 'package:planternativo/recetaEsp/recetaEsp.dart';
import 'package:planternativo/recetas/recetas.dart';
import 'package:planternativo/restaurantes/restaurantes.dart';
import 'package:planternativo/restaurantes/restaurantes.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _currentPageIndex = 0;
  final _pagesNameList = ["Inicio", "Restaurantes", "Recetas", "Recetas esp"];

  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
    String _telefono = "3318503861";
    String _imagen =
        "https://www.sabrosia.pr/resizer/U8dw60E4ucVskb2IH5vRcWVWlvw=/1440x0/filters:format(jpg):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/metroworldnews/JDPCVRO6AFGATNQHEVA4EFZCTA.jpg";
    ;
    String _noticias =
        "¿Que putas chingadas madres dijiste de mí, pinche escuincle baboso? para que sepas yo entrené en el gimnasio del señor Julio Cesar Chavez, tengo un record de 50 knockouts, fui al colegio militar de la ciudad de México y un doctorado en ingenieria nuclear, ¿sabes que significa eso? que pudo volar tu pinche cabecita hueca con una bomba que estoy preparando especialmente para tí, y no sólo eso tambien onions experto en el manejo de armas largas y tengo acceso a todo un arsenal de Uzis AK 47 y R-15s, si tan solo hubieras pensado un poquito más y no hubieras abierto el pinche hocico de perro que tienes, no tendrías que rezar por tu vida. En estos momentos estoy rastreando tu direción IP para ubicar tu domicilio, te vas cagar cuando veas un chingo de camionetas esperando en la entrada de tu casa para acriibillarte. Mis hombres estan bien armados y son muy temerarios, saben hacer muy bien su trabajo y están dispuestos a exterminar hasta la ultima puta celúla más pequeña e insignificantede tu puta miserable existencia, escucha bien mis palabras nene, que ya no hay vuelta atrás, vete despidiendo de tu miserable existencia, escucha bien mis palabras nene, que ya no hay vuelta atrás, vete despidiendo de tu miserable vida cabrón, voy a convertir tus ultimas horas de vida en un autentico infierno, estas bien pinche muerto nene, estas bien pinche muerto.";
    var _pagesList = [
      Column(
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
            height: 10,
          ),
          Text(
            "Noticias",
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(
              fontSize: 30.0,
              color: Color.fromARGB(255, 2, 54, 4),
              fontWeight: FontWeight.bold,
            )),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: _screen.width * 0.96,
            height: _screen.height * 0.35,
            child: Card(
              shape: null,
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(_noticias,
                        style: GoogleFonts.overpass(
                            textStyle: TextStyle(
                          fontSize: 18,
                        ))),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                Text(
                  "Ordena a tu casa",
                  style: GoogleFonts.pacifico(
                      textStyle: TextStyle(
                    fontSize: 25.0,
                    color: Color.fromARGB(255, 2, 54, 4),
                    fontWeight: FontWeight.bold,
                  )),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    await FlutterPhoneDirectCaller.callNumber(_telefono);
                  },
                  icon: Icon(Icons.motorcycle),
                  label: Text("33-123-45-678"),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    //Navigation
                  },
                  icon: Icon(Icons.book),
                  label: Text("Menú online"),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Receta del día",
                  style: GoogleFonts.pacifico(
                      textStyle: TextStyle(
                    fontSize: 25.0,
                    color: Color.fromARGB(255, 2, 54, 4),
                    fontWeight: FontWeight.bold,
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RecetasEsp()));
                  },
                  child: Container(
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
                ),
              ],
            )
          ]),
        ],
      ),
      MapSample(),
      Recetas(),
    ]; /*
      return Scaffold(
        body: new Image.network(
          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fi.ytimg.com%2Fvi%2Fxy_buTCrpy8%2Fhqdefault.jpg&f=1&nofb=1",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      );*/
    return Scaffold(
      body: IndexedStack(
        index: _currentPageIndex,
        children: _pagesList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(
            () {
              _currentPageIndex = index;
              if (_currentPageIndex == 1) {
                checkPermissions();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MapSample()));
              }
            },
          );
        },
        items: [
          BottomNavigationBarItem(
            label: _pagesNameList[0],
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: _pagesNameList[1],
            icon: Icon(Icons.map_outlined),
          ),
          BottomNavigationBarItem(
            label: _pagesNameList[2],
            icon: Icon(Icons.fastfood_outlined),
          ),
        ],
      ),
    );
  }
}

void checkPermissions() async {
  var status = await Permission.location.request();
  print("Status:" + status.toString());
}

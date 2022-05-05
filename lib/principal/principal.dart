import 'package:cloud_firestore/cloud_firestore.dart';
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
                    child: FutureBuilder(
                        future: getNews(),
                        initialData: "Loading text..",
                        builder:
                            (BuildContext context, AsyncSnapshot<String> text) {
                          return Text(text.data!,
                              style: GoogleFonts.overpass(
                                  textStyle: TextStyle(
                                fontSize: 18,
                              )));
                        }),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Scaffold(
                                appBar: AppBar(
                                    title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Menú",
                                      style: GoogleFonts.pacifico(
                                          textStyle: TextStyle(
                                        fontSize: 30.0,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ),
                                  ],
                                )),
                                body: Center(
                                    child: Column(children: [
                                  Expanded(
                                      child: Container(
                                    child: ListView(
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                'assets/menu/1.png')),
                                        Image(
                                            image: AssetImage(
                                                'assets/menu/2.png')),
                                        Image(
                                            image: AssetImage(
                                                'assets/menu/3.png')),
                                        Image(
                                            image: AssetImage(
                                                'assets/menu/4.png')),
                                        Image(
                                            image: AssetImage(
                                                'assets/menu/5.png')),
                                        Image(
                                            image: AssetImage(
                                                'assets/menu/6.png')),
                                        Image(
                                            image: AssetImage(
                                                'assets/menu/7.png')),
                                        Image(
                                            image: AssetImage(
                                                'assets/menu/8.png')),
                                      ],
                                    ),
                                  )),
                                ])),
                              )),
                    );
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
    ];
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

Future<String> getNews() async {
  var collection = FirebaseFirestore.instance.collection('noticias');
  var docSnapshot = await collection.doc('DOfX6Vl9FyJtXkP3d2EK').get();
  if (docSnapshot.exists) {
    Map<String, dynamic>? data = docSnapshot.data();
    String value = data?['news'];
    print("Valor: $value");
    return value;
  } else {
    return "Error";
  }
}

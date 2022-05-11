import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:planternativo/auth/bloc/auth_bloc.dart';
import 'package:planternativo/login/login.dart';
import 'package:planternativo/perfil/perfil.dart';
import 'package:planternativo/recetaEsp/recetaEsp.dart';
import 'package:planternativo/recetas/bloc/pending_bloc.dart';
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
                    //NECESITAMOS TENER UNA RECETA SIN HARDCODEAR PENDEJOS ESTÚPIDOS
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RecetasEsp({
                              "stars": 5,
                              "name": "Ceviche de seitán",
                              "author": "Iñaki Orozco",
                              "ingredients":
                                  "1/4 de Choclo desgranando\n2 Camotes amarillos\n1/4 de Seitán natural\n200g de champiñones frescos\n1 Pimiento\n3/4  de cebolla\n5 tallos de apio\n200ml de jugo de Kión\n1 ají limo\nZumo de 8 limones",
                              "image":
                                  "https://scontent-qro1-1.xx.fbcdn.net/v/t1.6435-9/118733503_3271728659586818_2944357760166773043_n.jpg?stp=dst-jpg_p180x540&_nc_cat=100&ccb=1-6&_nc_sid=8bfeb9&_nc_eui2=AeGEsAERyoGeDkBU8gK1RSLIInHNmF2cwJAicc2YXZzAkPAXYw4-tnfoJdcm0BVRPJuqcx0vQjrIRLAuQaO72XHT&_nc_ohc=XilYn5eTPQIAX8KCLBQ&_nc_ht=scontent-qro1-1.xx&oh=00_AT_WHZdrr4WWBekCN4FWPfJrZ-dYjzIqug2OOtQm3zfe8A&oe=62A217DB",
                              "description":
                                  "Sancochar los Camotes\nSancochar el Choclo\nCortar en cuadritos el Seitán y los champiñones en láminas.\nCortar la cebolla tipo pluma. \nEl Pimiento cortar en cuadraditos.\n Licuar el apio, ají limo( a gusto), limón, sal.\nEn un bold mezclar el Seitán natural con los champiñones y el Pimiento. Incorporar lo licuado.\nDejar incurrir por 3 minutos.\nServir sobre una hoja de Lechuga, el Ceviche, acompañar con el Camote cortado en rodajas, con choclo desgranando, y la cebolla  fresca."
                            })));
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: BlocConsumer<PendingBloc, PendingState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is PendingFotosSuccessState) {
                              return ListView.builder(
                                itemCount: state.myData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  //una vez que acabe el ciclo, ya tendremos el elemento con más calificación, tenemos que regresarlo
                                  int acum = 0;
                                  if (state.myData[index]['stars'] > acum) {
                                    acum = state.myData[index]['stars'];
                                  }
                                  var platillo = {
                                    state.myData[index]['stars'],
                                    state.myData[index]['nombre'],
                                    state.myData[index]['autor'],
                                    state.myData[index]['ingredientes'],
                                    state.myData[index]['imagen'],
                                    state.myData[index]['procedimiento']
                                  };
                                  return Image.network(
                                    state.myData[index]['imagen'],
                                    fit: BoxFit.fill,
                                  );
                                },
                              ); /*
                              itemBuilder:
                              (BuildContext context, int index) {
                                return Image.network(
                                  state.myData[index]['imagen'],
                                  fit: BoxFit.fill,
                                );
                              };*/
                            }
                            return Image.network(
                              "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Feskipaper.com%2Fimages%2Fgreen-13.jpg&f=1&nofb=1",
                              fit: BoxFit.fill,
                            );
                          }),
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
    return value;
  } else {
    return "Error";
  }
}

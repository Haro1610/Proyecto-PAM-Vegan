import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planternativo/recetaEsp/recetaEsp.dart';

class Platillo extends StatelessWidget {
  int stars = 6;
  String name = "Pozole";
  String author = "Juan";

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

class Recetas extends StatelessWidget {
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
            height: 60,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Planternativo",
                textAlign: TextAlign.center,
                style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),
          ),
          Text("Recetas de la semana",
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 17, 88, 19),
                  fontWeight: FontWeight.bold,
                ),
              )),
          Expanded(
            child: Container(
              height: 0,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Platillo(3, "Tacos", "Juan"),
                  Platillo(4, "Pozole", "Pedro"),
                  Platillo(5, "Chimichangas", "Alejandra"),
                  Platillo(6, "Gorditas", "Juan"),
                  Platillo(0, "Ratatouille", "Roberto"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    /*  return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.lightgreen, Colors.green])),
        //height: MediaQuery.of(context).size.height,
        child: Container(
          margin: EdgeInsets.only(top: 50.0),
          width: double.infinity,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Recetas de la semana",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 700,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Platillo(3, "Tacos", "Juan"),
                        Platillo(4, "Pozole", "Pedro"),
                        Platillo(5, "Chimichangas", "Alejandra"),
                        Platillo(6, "Gorditas", "Juan"),
                        Platillo(0, "Ratatouille", "Roberto"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ); */

    /*    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.lightgreen, Colors.green])),
            height: MediaQuery.of(context).size.height,
            child: Container(
              margin: EdgeInsets.only(top: 50.0),
              width: double.infinity,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Recetas de la semana",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 700,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Platillo(3, "Tacos", "Juan"),
                            Platillo(4, "Pozole", "Pedro"),
                            Platillo(5, "Chimichangas", "Alejandra"),
                            Platillo(6, "Gorditas", "Juan"),
                            Platillo(0, "Ratatouille", "Roberto"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ); */
  }
}

Row _CountStars(int stars) {
  var starFull = Icon(
    Icons.star,
    color: Colors.green,
    size: 24.0,
    semanticLabel: 'Text to announce in accessibility modes',
  );
  var starEmpty = Icon(
    Icons.star_border_outlined,
    color: Colors.green,
    size: 24.0,
    semanticLabel: 'Text to announce in accessibility modes',
  );
  var starGray = Icon(
    Icons.star,
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

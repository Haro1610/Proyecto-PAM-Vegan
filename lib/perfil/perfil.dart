import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Platillo extends StatelessWidget {
  int stars = 6;
  String name = "Pozole";

  Platillo(int stars, String name) {
    this.stars = stars;
    this.name = name;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
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
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.lightGreen, Colors.greenAccent])),
              height: MediaQuery.of(context).size.height,
              child: Container(
                margin: EdgeInsets.only(top: 50.0),
                width: double.infinity,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://islam.ru/en/sites/default/files/img/story/2014/02/red-fox2.jpg",
                        ),
                        radius: 50.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Iñaki Orozco",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
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
                                    Text(
                                      "Recetas",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "1200",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          height: 500,
                          child: ListView(
                              scrollDirection: Axis.vertical,
                              children: [
                                Platillo(3, "Tacos"),
                                Platillo(4, "Pozole"),
                                Platillo(5, "Chimichangas"),
                                Platillo(6, "Gorditas"),
                                Platillo(0, "Ratatouille"),
                              ])),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

Row _CountStars(int stars) {
  var starFull = Icon(
    Icons.star,
    color: Colors.greenAccent,
    size: 24.0,
    semanticLabel: 'Text to announce in accessibility modes',
  );
  var starEmpty = Icon(
    Icons.star_border_outlined,
    color: Colors.greenAccent,
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

import 'package:flutter/material.dart';
import 'package:planternativo/login/login.dart';
import 'package:planternativo/perfil/perfil.dart';
import 'package:planternativo/recetaEsp/recetaEsp.dart';
import 'package:planternativo/recetaEsp/recetas.dart';
import 'package:planternativo/recetas/recetas.dart';
import 'package:planternativo/restaurantes/restaurantes.dart';
import 'package:planternativo/restaurantes/restaurantes.dart';

class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _currentPageIndex = 0;
  final _pagesNameList = ["Inicio", "Restaurantes", "Recetas", "Recetas esp"];
  final _pagesList = [
    Center(child: Text("Inicio")),
    Center(child: Text("Restaurantes")),
    Center(child: Text("Recetas")),
    Center(child: Text("Recetas esp"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inicio"),
          actions: <Widget>[
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Perfil()));
                  },
                  icon: Icon(Icons.account_circle_rounded),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  },
                  icon: Icon(Icons.logout),
                ),
              ],
            )
          ],
          flexibleSpace: Container(
              height: 120,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.green,
                Color.fromARGB(255, 152, 202, 36)
              ]))),
        ),
        body: Stack(
          children: [
            Card(
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    "https://cdn.kiwilimon.com/recetaimagen/27982/th5-640x640-27850.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ]),
            ),
            IndexedStack(
              index: _currentPageIndex,
              children: _pagesList,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentPageIndex,
          onTap: (index) {
            setState(() {
              _currentPageIndex = index;
              if (_currentPageIndex == 1) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MapSample()));
              }
            });
            // Respond to item press.
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
        ));
  }
}

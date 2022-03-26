import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _currentPageIndex = 1;
  final _pagesNameList = [
    "Inicio",
    "Restaurantes",
    "Recetas",
  ];
  final _pagesList = [
    Center(child: Text("Inicio")),
    Center(child: Text("Restaurantes")),
    Center(child: Text("Recetas")),
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
                  onPressed: () {},
                  icon: Icon(Icons.account_circle_rounded),
                ),
                IconButton(
                  onPressed: () {},
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

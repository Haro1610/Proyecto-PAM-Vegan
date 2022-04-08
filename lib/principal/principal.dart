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
    MapSample(),
    Recetas(),
    Center(child: Text("Recetas esp"))
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      /*      appBar: AppBar(
        title: const Text("Inicio"),
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Perfil()));
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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Color.fromARGB(255, 152, 202, 36)],
            ),
          ),
        ),
      ), */
      /*body:  Stack(
        children: [
          Card(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                "https://cdn.kiwilimon.com/recetaimagen/27982/th5-640x640-27850.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ), */
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_rounded),
              title: Text("Mi perfil"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Perfil()));
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: Text("Cerrar Sesion"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Login()));
              },
            ),

            // Update the state of the app.
            // ...
          ],
        ),
      ),
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
            },
          );
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
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.menu),
        color: Colors.white,
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}

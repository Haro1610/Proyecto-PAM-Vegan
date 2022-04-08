import 'package:flutter/material.dart';
import 'package:planternativo/login/login.dart';
import 'package:planternativo/perfil/perfil.dart';
import 'package:planternativo/recetaEsp/recetaEsp.dart';
import 'package:planternativo/recetaEsp/recetas.dart';
import 'package:planternativo/recetas/recetas.dart';
import 'package:planternativo/restaurantes/restaurantes.dart';
import 'package:planternativo/restaurantes/restaurantes.dart';
import 'package:permission_handler/permission_handler.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              if (_currentPageIndex == 1) {
                _checkPermissions();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MapSample()));
              }
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
    );
  }
}

void _checkPermissions() async {
  var status = await Permission.camera.status;
  if (status.isDenied) {
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
  }

// You can can also directly ask the permission about its status.
  if (await Permission.location.isRestricted) {
    // The OS restricts access, for example because of parental controls.
  }
}

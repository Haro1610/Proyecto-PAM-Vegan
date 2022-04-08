import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:planternativo/login/login.dart';
import 'package:planternativo/principal/principal.dart';
import 'package:planternativo/recetaEsp/recetaEsp.dart';
import 'package:planternativo/recetas/recetas.dart';
import 'package:planternativo/recetas/recetas.dart';
import 'package:planternativo/restaurantes/restaurantes.dart';
import 'package:planternativo/perfil/perfil.dart';

//Bloc

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'Material App',
<<<<<<< HEAD
      home: RecetaEsp(),
=======
      home: Principal(),
>>>>>>> 20f9efcb2ae9241731486344486b2c9446b361db
      /*MultiBlocProvider(
        providers: [
          
          BlocProvider(create: (context) => FraseBloc()..add(FraseGet())),
          BlocProvider(create: (context) => ImageBloc()..add(ImageGet())),
          BlocProvider(create: (context) => TimeBloc()..add(TimeGet())),
        ],
        child: Principal(),
      ),*/
    );
  }
}

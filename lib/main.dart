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
      theme: ThemeData(primarySwatch: Colors.purple),
      title: 'Material App',
      home: Restaurantes(),
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

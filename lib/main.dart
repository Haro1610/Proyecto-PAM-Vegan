import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:planternativo/auth/bloc/auth_bloc.dart';
import 'package:planternativo/login/login.dart';
import 'package:planternativo/principal/principal.dart';
import 'package:planternativo/recetaEsp/recetaEsp.dart';
import 'package:planternativo/recetas/bloc/crear_bloc.dart';
import 'package:planternativo/restaurantes/restaurantes.dart';
import 'package:planternativo/perfil/perfil.dart';

import 'recetas/bloc/pending_bloc.dart';

//Bloc

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //buena branch
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: ((context) => AuthBloc()..add(VerifyAuthEvent())),
      ),
      BlocProvider(create: ((context) => CrearBloc())),
      BlocProvider(create: (context) => PendingBloc()..add(GetRecetasEvent())),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
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

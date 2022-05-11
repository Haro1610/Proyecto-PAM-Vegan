import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:planternativo/auth/bloc/auth_bloc.dart';
import 'package:planternativo/login/login.dart';
import 'package:planternativo/principal/principal.dart';
<<<<<<< HEAD
import 'package:planternativo/recetas/bloc/crear_bloc.dart';
=======
import 'package:planternativo/recetaEsp/recetaEsp.dart';
import 'package:planternativo/restaurantes/restaurantes.dart';
import 'package:planternativo/perfil/perfil.dart';
>>>>>>> main

//Bloc

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: ((context) => AuthBloc()..add(VerifyAuthEvent())),
      ),
      BlocProvider(create: ((context) => CrearBloc()))
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
<<<<<<< HEAD
      home: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is AuthSuccesState) {
            return Principal();
          } else if (state is AuthErrorState) {
            return Login();
          } else if (state is SingOutSucces) {
            return Login();
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
=======
      home: Restaurantes(),
      /*MultiBlocProvider(
        providers: [
          
          BlocProvider(create: (context) => FraseBloc()..add(FraseGet())),
          BlocProvider(create: (context) => ImageBloc()..add(ImageGet())),
          BlocProvider(create: (context) => TimeBloc()..add(TimeGet())),
        ],
        child: Principal(),
      ),*/
>>>>>>> main
    );
  }
}

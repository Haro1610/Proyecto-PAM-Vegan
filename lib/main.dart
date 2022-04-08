import 'package:flutter/material.dart';
import 'package:planternativo/principal/principal.dart';

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
      home: Principal(),
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

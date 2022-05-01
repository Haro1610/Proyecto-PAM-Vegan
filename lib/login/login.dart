import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planternativo/auth/bloc/auth_bloc.dart';
import 'package:planternativo/principal/principal.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Planternativo",
            style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                letterSpacing: 5,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 31, 143, 81)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Center(
              child: Container(
                  width: 400,
                  height: 240,
                  child: Image.network(
                      "https://www.yorokobu.es/wp-content/uploads/2016/11/vegano.jpg")),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            //padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 27, 155, 15),
                borderRadius: BorderRadius.circular(20)),
            child: OutlinedButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(GoogleAuthEvent());
              },
              child: Text(
                'Login con google',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(height: 150),
                Image.asset('assets/download.gif')
              ],
            ),
            decoration: BoxDecoration(color: Color.fromRGBO(255, 222, 0, 1)),
          ),
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, .8)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // SizedBox(height: 150),
                    Text(
                      "Planternativo",
                      style: GoogleFonts.pacifico(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 200),
                    Container(
                      height: 300,
                      width: 200,
                      child: Material(
                        elevation: 8.0,
                        shape: CircleBorder(),
                        child: Image.asset("assets/logo.png"),
                      ),
                    ),
                    SignInButton(
                      Buttons.Google,
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context)
                            .add(GoogleAuthEvent());
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

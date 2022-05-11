import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planternativo/perfil/bloc/profile_recetas_bloc.dart';
import 'package:planternativo/recetas/recetas.dart';

import '../auth/bloc/auth_bloc.dart';
import 'bloc/profile_recetas_bloc.dart';

class Perfil extends StatefulWidget {
  Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => PerfilState();
}

class PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 35, 129, 13),
              Color.fromARGB(255, 93, 144, 100)
            ],
          ),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  BlocProvider.of<AuthBloc>(context).usuario.photoURL!),
              radius: 50.0,
            ),
            Text(BlocProvider.of<AuthBloc>(context).usuario.displayName!,
                style: GoogleFonts.overpass(
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                )),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              clipBehavior: Clip.antiAlias,
              color: Colors.green,
              elevation: 8.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Recetas",
                            style: GoogleFonts.overpass(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "3",
                            style: GoogleFonts.overpass(
                              textStyle: TextStyle(
                                fontSize: 19.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<ProfileRecetasBloc, ProfileRecetasState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ProfileRecetasLoadingState) {
                    return ListView.builder(
                      itemCount: 25,
                      itemBuilder: (BuildContext context, int index) {
                        return YoutubeShimmer();
                      },
                    );
                  } else if (state is ProfileRecetasEmptyState) {
                    return Center(
                      child: Text("No hay datos por mostrar"),
                    );
                  } else if (state is ProfileRecetasSuccessState) {
                    return ListView.builder(
                      itemCount: state.myData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Platillo(
                            state.myData[index]['stars'],
                            state.myData[index]['nombre'],
                            state.myData[index]['autor'],
                            state.myData[index]['ingredientes'],
                            state.myData[index]['imagen'],
                            state.myData[index]['procedimiento']);
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Row _CountStars(int stars) {
  var starFull = Icon(
    Icons.star,
    color: Color.fromARGB(255, 93, 144, 100),
    size: 24.0,
    semanticLabel: 'Text to announce in accessibility modes',
  );
  var starEmpty = Icon(
    Icons.star_border_outlined,
    color: Color.fromARGB(255, 93, 144, 100),
    size: 24.0,
    semanticLabel: 'Text to announce in accessibility modes',
  );
  var starGray = Icon(
    Icons.star_border_outlined,
    color: Colors.grey,
    size: 24.0,
    semanticLabel: 'Text to announce in accessibility modes',
  );
  switch (stars) {
    case 0:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [starEmpty, starEmpty, starEmpty, starEmpty, starEmpty],
      );
    case 1:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [starFull, starEmpty, starEmpty, starEmpty, starEmpty],
      );
    case 2:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [starFull, starFull, starEmpty, starEmpty, starEmpty],
      );
    case 3:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [starFull, starFull, starFull, starEmpty, starEmpty],
      );
    case 4:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [starFull, starFull, starFull, starFull, starEmpty],
      );
    case 5:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [starFull, starFull, starFull, starFull, starFull],
      );
    default:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [starGray, starGray, starGray, starGray, starGray],
      );
  }
}

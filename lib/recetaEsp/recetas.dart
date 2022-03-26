import 'package:flutter/material.dart';
import 'dart:convert';
import 'recetasJson.dart';

import 'receta_item.dart';

class Recetas extends StatefulWidget {
  Recetas({Key? key}) : super(key: key);

  @override
  State<Recetas> createState() => _RecetasState();
}

class _RecetasState extends State<Recetas> {
  var url =
      "https://api.sheety.co/f386175add37b57b868d5f8c1f25d7e2/apiParaRecetas/hoja1";

  final String strRecetas = RECETAS;

  final _recetas = jsonDecode(RECETAS);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _recetas["hoja1"].length,
              itemBuilder: (BuildContext context, int index) {
                return CuentaItem(
                  nombre: _recetas["hoja1"][index]["nombre"],
                  autor: _recetas["hoja1"][index]["autor"],
                  imagen: _recetas["hoja1"][index]["imagen"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CuentaItem extends StatelessWidget {
  final String nombre;
  final String autor;
  final String imagen;
  const CuentaItem({
    Key? key,
    this.nombre = "Cuenta",
    this.autor = "0000",
    this.imagen = "0.0",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* return Card(
      child: ListTile(
        title: Text(
          "$nombre",
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text("~$autor"),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "\$$imagen",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              "Saldo disponible",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    ); */
    return Card(
      child: ListTile(
        leading: Image.network(
          imagen,
          height: 70,
        ),
        title: Text(nombre),
        subtitle: Text(autor),
      ),
    );
  }
}

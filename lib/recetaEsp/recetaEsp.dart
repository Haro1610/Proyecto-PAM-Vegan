import 'package:flutter/material.dart';

class RecetaEsp extends StatefulWidget {
  RecetaEsp({Key? key}) : super(key: key);

  @override
  State<RecetaEsp> createState() => _RecetaEspState();
}

class _RecetaEspState extends State<RecetaEsp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightGreen,
              Colors.blueAccent,
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    leading: Image.network(
                        "https://mui.kitchen/__export/1627825762891/sites/muikitchen/img/2021/08/01/pollo-al-horno-con-limon.jpg_1778406236.jpg"),
                    title: const Text('Pollo asado'),
                    subtitle: Text(
                      'por Anasofia',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const Text(
                        "Ingredientes",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("-Un pollo"),
                          Text("-Sazonador"),
                          Text("-Limon"),
                          Text("-Especias"),
                          Text("-Adobo"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Preparacion"),
                      Text("-Mezcle las especias y limon en un recipiente"),
                      Text("-Frote al pollo con la mezcla"),
                      Text("-Deje reposar por dos horas"),
                      Text(
                          "-Introducir al horno a 80 grados centigrados por una hora"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

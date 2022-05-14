import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  List<Marker> _markers = <Marker>[];

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(33.6844, 73.0479),
  //   zoom: 14,
  // );
  static CameraPosition initialMapPosition = CameraPosition(
      target: LatLng(20.665965601910823, -103.3937151456212), zoom: 20);

  List<Marker> _puntos = [];
  List<Marker> _list = const [
    Marker(
        markerId: MarkerId('La estancia vegana'),
        position: LatLng(20.665965601910823, -103.3937151456212),
        infoWindow: InfoWindow(title: 'La estancia vegana')),
    Marker(
        markerId: MarkerId('Vegano 2'),
        position: LatLng(20.675798389104823, -103.35728688472331)),
    Marker(
        markerId: MarkerId('Fonda vegana'),
        position: LatLng(20.681112855013716, -103.35297200997564)),
    Marker(
        markerId: MarkerId('Chico zapote'),
        position: LatLng(20.674590923183647, -103.36084111355395)),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _puntos.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
            initialCameraPosition: initialMapPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: Set<Marker>.of(_puntos)),
      ),
    );
  }
}

// List<Marker> list = const [
//   Marker(
//       markerId: MarkerId('SomeId'),
//       position: LatLng(33.6844, 73.0479),
//       infoWindow: InfoWindow(
//           title: 'The title of the marker'
//       )
//   ),
//   Marker(
//       markerId: MarkerId('SomeId'),
//       position: LatLng( 33.738045,73.084488),
//       infoWindow: InfoWindow(
//           title: 'e-11 islamabd'
//       )
//   ),
// ];
//
// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   _markers.addAll(
//       list);
// }
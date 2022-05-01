import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(20.665965601910823, -103.3937151456212), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _determinePosition();

          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));

          markers.clear();

          markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude)));

          setState(() {});
        },
        label: const Text("Current Location"),
        icon: const Icon(Icons.location_history),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}

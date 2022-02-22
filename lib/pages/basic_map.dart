import 'package:flutter/material.dart';
import 'package:flutter_mapbox/main.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class BasicMap extends StatelessWidget {
  const BasicMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Map'),
      ),
      body: MapboxMap(
        accessToken: MyApp.accessToken,
        initialCameraPosition: const CameraPosition(
          target: LatLng(-6.90223519684206, 107.61880338557762),
          zoom: 15,
        ),
      ),
    );
  }
}

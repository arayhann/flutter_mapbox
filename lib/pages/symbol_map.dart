import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mapbox/main.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class SymbolMap extends StatefulWidget {
  const SymbolMap({Key? key}) : super(key: key);

  @override
  State<SymbolMap> createState() => _SymbolMapState();
}

class _SymbolMapState extends State<SymbolMap> {
  MapboxMapController? controller;

  void _onMapCreated(MapboxMapController controller) {
    this.controller = controller;
    _addSymbol();
  }

  Future<void> _addSymbol() async {
    await _addImageFromAsset("assetImage", "assets/image-sample.jpeg");

    const symbolOptions = SymbolOptions(
      iconImage: "assetImage",
      iconSize: 0.2,
      geometry: LatLng(-6.90223519684206, 107.61880338557762),
    );
    controller?.addSymbol(symbolOptions);
  }

  Future<void> _addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return controller!.addImage(name, list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symbol Map'),
      ),
      body: MapboxMap(
        accessToken: MyApp.accessToken,
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(-6.90223519684206, 107.61880338557762),
          zoom: 15,
        ),
      ),
    );
  }
}

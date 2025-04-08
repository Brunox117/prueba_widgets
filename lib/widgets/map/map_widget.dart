import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/shared/custom_card.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return CustomCard(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'Mapa',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(19.4326, -99.1332), // Ciudad de México
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/widgets/nav.dart';
import 'package:flutter/services.dart';
import 'package:project/widgets/bottom_sheet.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  String? _darkMapStyle;

  final LatLng _initialPosition = const LatLng(1.28675, 103.84775);

  @override
  void initState() {
    _loadMapStyles();
    super.initState();
  }

  Future<void> _loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString('assets/dark_mode.json');
    if (mapController != null) {
      mapController!.setMapStyle(_darkMapStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Nav(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              controller.setMapStyle(_darkMapStyle);
              mapController = controller;
            },
            style: _darkMapStyle,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 15.0,
            ),
            myLocationEnabled: true,
            mapType: MapType.normal,
          ),
          const BottomSheetWidget(),
        ],
      ),
    );
  }
}

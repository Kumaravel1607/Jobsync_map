import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jobsynchs/constant/color.dart';

class Polygon_route extends StatefulWidget {
  Polygon_route({Key? key}) : super(key: key);

  @override
  State<Polygon_route> createState() => _Polygon_routeState();
}

class _Polygon_routeState extends State<Polygon_route> {
  Completer<GoogleMapController> _controller = Completer();

  // on below line we have set the camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(12.1211, 78.1582),
    zoom: 8,
  );

  Set<Polygon> _polygon = HashSet<Polygon>();
  Set<Marker> _marker = {};

  // created list of locations to display polygon
  List<LatLng> points = [
    LatLng(12.1211, 78.1582),
    LatLng(11.3410, 77.7172),
    LatLng(11.6643, 78.1460),
    LatLng(11.739325, 78.962375),
    LatLng(12.1211, 78.1582),
  ];
  LatLng? location;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _polygon.add(Polygon(
      polygonId: PolygonId('1'),
      points: points,
      fillColor: Blue.withOpacity(0.3),
      strokeColor: Blue,
      geodesic: true,
      strokeWidth: 4,
    ));
    for (int i = 0; i < points.length; i++) {
      _marker.add(Marker(
        markerId: MarkerId(i.toString()),
        position: points[i],
        infoWindow: InfoWindow(
          title: points.toString(),
        ),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGoogle,
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        // on below line we have enabled compass location
        compassEnabled: true,
        polygons: _polygon,
        // displayed google map
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _marker,
      ),
    );
  }
}

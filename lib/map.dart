import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocode/geocode.dart';

class Map extends StatefulWidget {
  final String add;
  // double lat;
  // double lng;
  Map({
    Key? key,
    //required this.lng, required this.lat
    required this.add,
  }) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  // String LatLang = '';

  //late double ad;
  bool _isLoading = true;

  LatLng? _currentPosition;

  Completer<GoogleMapController> mapController = Completer();

  List<Marker> _marker = [];
  List<Marker> _list = [
    Marker(markerId: MarkerId('0'), position: LatLng(12.127531, 78.155359))
  ];
  // static const CameraPosition GoogleCamera =
  //     CameraPosition(target: LatLng(12.127531, 78.155359), zoom: 14);
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _marker.addAll(_list);
  //   _getAddressFromLatLng();
  // }

  double _latitude = 0;
  double _longitude = 0;

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
    //getLatLon();
    getcoordinates();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getcoordinates() async {
    final List<Location> locations = await locationFromAddress(widget.add
        // 'KPR Institute Of Engineering and Technology,Coimbatore'
        //'Adhagapadi ,Dharmapuri,Tamilnadu'
        );
    if (locations == null || locations.isEmpty) {
      return;
    }
    final Location firstLocation = locations.first;
    final List<Placemark> places = await placemarkFromCoordinates(
      firstLocation.latitude,
      firstLocation.longitude,
    );
    double _latitude = firstLocation.latitude;
    double _longitude = firstLocation.longitude;
    LatLng location = LatLng(_latitude, _longitude);
    print(location);
    setState(() {
      _currentPosition = location;
      _isLoading = false;
      _marker.clear();
      _marker.add(Marker(
        markerId: MarkerId(location.toString()),
        position: location,
        infoWindow: InfoWindow(
          title: widget.add,
        ),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      ));
      // _list.add(
      //     Marker(markerId: MarkerId(location.toString()), position: location));
      //var latLng = LatLng(firstLocation.latitude, firstLocation.longitude);
    });
    // print(_latitude);
    // print(_longitude);
  }

  // Future<void> getLatLon() async {
  //   GeoCode geoCode = GeoCode();

  //   try {
  //     Coordinates coordinates = await geoCode.forwardGeocoding(
  //         address:
  //             'seenu mansion,sooodamani street,Dharmapuri,Tamil Nadu,India');
  //     final lat = coordinates.latitude;
  //     final lon = coordinates.longitude;

  //     // _marker.clear();
  //     // _marker.add(Marker(
  //     //     markerId: const MarkerId('0'),
  //     //     position: LatLng(_latitude, _longitude)));

  //     setState(() {
  //       _latitude = lat!;
  //       _longitude = lon!;
  //       print(_latitude);
  //       print(_longitude);

  //       // initialCameraPosition:
  //       // CameraPosition(
  //       //     target: LatLng(_latitude, _longitude

  //       //         // widget.lat, widget.lng
  //       //         // 12.127531,
  //       //         // 78.155359
  //       //         ),
  //       //     zoom: 14);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: _currentPosition!,
                  // LatLng(_latitude, _longitude

                  //     // widget.lat, widget.lng
                  //     // 12.127531,
                  //     // 78.155359
                  //     ),
                  zoom: 14),
              onMapCreated: (GoogleMapController controller) {
                mapController.complete(controller);
              },
              markers: Set.of(_marker),
              mapType: MapType.normal,
              compassEnabled: true,
            ),
      // GoogleMap(
      //     scrollGesturesEnabled: true,
      //     mapType: MapType.normal,
      //     initialCameraPosition: CameraPosition(
      //         target: LatLng(_latitude, _longitude), zoom: 14)),
    );
  }
}

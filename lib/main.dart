import 'package:flutter/material.dart';
import 'package:jobsynchs/Addressfield.dart';
import 'package:jobsynchs/map.dart';
import 'package:jobsynchs/polygon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Splash(),
      // home: Map()
      // home: Address_field(),
      home: Polygon_route(),
    );
  }
}

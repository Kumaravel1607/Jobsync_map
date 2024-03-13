import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jobsynchs/Addressfield.dart';
import 'package:jobsynchs/constant/color.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => Address_field()));

      //SharedPreferences session = await SharedPreferences.getInstance();
      // var email = session.getString('email');
      // var mobile = session.getString('phone');
      // var token = session.getString('token');
      // print("-------");
      // print(email);
      // if (email == null || email == "") {
      //   // if (token != null) {

      //   Navigator.of(context).pushReplacement(MaterialPageRoute(
      //       builder: (BuildContext context) => Staff_Login()));
      // } else {
      //   Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (BuildContext context) => Navigation()));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "JobSynch",
                style: TextStyle(
                    color: black,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              // CircularProgressIndicator(
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              //   backgroundColor: Colors.white,
              //   strokeWidth: 2,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

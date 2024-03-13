import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:jobsynchs/constant/color.dart';
import 'package:jobsynchs/map.dart';

class Address_field extends StatefulWidget {
  Address_field({Key? key}) : super(key: key);

  @override
  State<Address_field> createState() => _Address_fieldState();
}

class _Address_fieldState extends State<Address_field> {
  String? countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String address = "";
  String add = '';

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController suburb = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController building = TextEditingController();
  TextEditingController zipcode = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // address = 'seenu mansion,soodamani street,Dharmapuri,Tamil Nadu,India';
    _getAddressFromLatLng();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Blue,
          title: Text(
            'Address Field',
            style: TextStyle(color: white),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  CSCPicker(
                    layout: Layout.vertical,

                    showStates: true,
                    showCities: true,

                    ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                    flagState: CountryFlag.DISABLE,

                    countrySearchPlaceholder: "Country",
                    stateSearchPlaceholder: "State",
                    citySearchPlaceholder: "City",

                    ///labels for dropdown
                    countryDropdownLabel: "Country",
                    stateDropdownLabel: "State",
                    cityDropdownLabel: "City",
                    selectedItemStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1)),
                    disabledDropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: white,
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1)),
                    dropdownHeadingStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),

                    dropdownItemStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),

                    dropdownDialogRadius: 10.0,
                    searchBarRadius: 10.0,

                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        // /store value in city variable
                        stateValue = value;
                      });
                    },

                    ///triggers once city selected in dropdown
                    onCityChanged: (value) {
                      setState(() {
                        // /store value in city variable
                        cityValue = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 55,
                    child: TextFormField(
                      // onChanged: (value) {
                      //   context
                      //       .read<LoginBloc>()
                      //       .add(EmailEvent(value));
                      // },

                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter Suburb";
                        }

                        return null;
                      },
                      controller: suburb,
                      autocorrect: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Blue, width: 0.5)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: box, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Blue, width: 0.5),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 5),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Suburb",
                        hintStyle: const TextStyle(
                            color: black, fontFamily: 'Rubik', fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 55,
                    child: TextFormField(
                      // onChanged: (value) {
                      //   context
                      //       .read<LoginBloc>()
                      //       .add(EmailEvent(value));
                      // },

                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter Street";
                        }

                        return null;
                      },
                      controller: street,
                      autocorrect: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Blue, width: 0.5)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: box, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Blue, width: 0.5),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 5),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Street",
                        hintStyle: const TextStyle(
                            color: black, fontFamily: 'Rubik', fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 55,
                    child: TextFormField(
                      // onChanged: (value) {
                      //   context
                      //       .read<LoginBloc>()
                      //       .add(EmailEvent(value));
                      // },

                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter Building";
                        }

                        return null;
                      },
                      controller: building,
                      autocorrect: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Blue, width: 0.5)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: box, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Blue, width: 0.5),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 5),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Building Address",
                        hintStyle: const TextStyle(
                            color: black, fontFamily: 'Rubik', fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 55,
                    child: TextFormField(
                      // onChanged: (value) {
                      //   context
                      //       .read<LoginBloc>()
                      //       .add(EmailEvent(value));
                      // },

                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter zip code";
                        }

                        return null;
                      },
                      controller: zipcode,
                      autocorrect: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Blue, width: 0.5)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: box, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Blue, width: 0.5),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 5),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Zipcode",
                        hintStyle: const TextStyle(
                            color: black, fontFamily: 'Rubik', fontSize: 14),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Blue,
                        minimumSize: const Size.fromHeight(44),
                      ),
                      onPressed: () {
                        setState(() {
                          if (formkey.currentState!.validate()) {
                            var Street = street.text;
                            var Sub = suburb.text;
                            var Building = building.text;
                            var Code = zipcode.text;
                            // print(Street);

                            address =
                                "$Building,$Street,$cityValue,$stateValue,$countryValue";

                            print(address);
                            _getAddressFromLatLng();

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Map(
                                          add: address,
                                          // lat: double.parse(Lat),
                                          // lng: double.parse(Lng),
                                        )),
                                (Route<dynamic> route) => false);
                          }
                        });
                      },
                      child: const Text(
                        'SUBMIT',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  String Lat = '';
  String Lng = '';
  Future _getAddressFromLatLng() async {
    try {
      List<Location> locations = await locationFromAddress(address);
      //'seenu mansion,soodamani street,Dharmapuri,Tamil Nadu,India');

      setState(() {
        Lat = locations.last.longitude.toString();

        Lng = locations.last.latitude.toString();
        print(Lat);
        print(Lng);
      });
    } catch (e) {
      print(e);
    }
  }
}

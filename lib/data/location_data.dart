import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tripguy/models/location_model.dart';

class LocationData {
  //get location data
  Future<List> getLocation() async {
    //try to get data from assets
    try {
      final String response =
          await rootBundle.loadString("assets/locations_data.json");

      //encode data
      final List<dynamic> finalLocationData = jsonDecode(response);

      return finalLocationData;

      // print(LocationModel.fromJson(finalLocationData[0]));
      //return data
      // final List<LocationModel> rawData = finalLocationData
      //     .map(
      //       (location) => LocationModel.fromJson(location),
      //     )
      //     .toList();

      // return rawData;
    } catch (e) {
      print("ERROR in getting location data from assets");
      throw "ERROR in getting location data from assets";
    }
  }
}

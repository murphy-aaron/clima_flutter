import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
      Location location = Location();
      await location.getCurrentLocation();
      latitude = location.latitude;
      longitude = location.longitude;

      var uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {'lat': '$latitude', 'lon': '$longitude', 'appid': '$kApiString', 'units': 'imperial'});
      NetworkHelper networkHelper = NetworkHelper(uri: uri);
      var weatherData = await networkHelper.getData();
      print(weatherData);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen();
      }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
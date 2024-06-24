import '../utilities/constants.dart';
import 'location.dart';
import 'networking.dart';

class WeatherModel {

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    var uri = Uri.https(kApiUrl, kApiPath,
        {'lat': '${location.latitude}', 'lon': '${location.longitude}', 'appid': '$kApiKey', 'units': 'imperial'});
    NetworkHelper networkHelper = NetworkHelper(uri: uri);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    Location location = Location();
    await location.getCurrentLocation();

    var uri = Uri.https(kApiUrl, kApiPath,
        {'q': cityName, 'appid': '$kApiKey', 'units': 'imperial'});
    NetworkHelper networkHelper = NetworkHelper(uri: uri);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 75) {
      return 'It\'s 🍦 time';
    } else if (temp > 65) {
      return 'Time for shorts and 👕';
    } else if (temp < 50) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
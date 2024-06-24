import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {

  NetworkHelper({required this.uri});

  final Uri uri;

  Future getData() async {
    Response response = await get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
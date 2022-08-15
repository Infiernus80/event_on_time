import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomDropdown with ChangeNotifier {
  Map<String, dynamic> _map = {};

  Map<String, dynamic> get map => _map;

  set map(Map<String, dynamic> map) {
    _map = map;
  }
  bool isData = true;

  Future confirmarRechazar(String token) async {
    final response = await http.put(
      Uri.parse(
          'https://eventontime.herokuapp.com/api/guest/assitence/confirmation'),
      headers: {
        "Authorization": token,
      },
    );

    if (response.statusCode == 200) {
      isData = false;
      _map = json.decode(response.body);
      notifyListeners();
    } else {
      return debugPrint('Error 404');
    }
  }

  // get mapaString => ;

  set mapaString(value) {
    _map = {
      'result': {
        'confirmation': value,
      }
    };

    debugPrint('$map');
  }



  isDataGet() => isData;
}

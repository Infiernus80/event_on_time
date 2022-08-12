import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomDropdown with ChangeNotifier {
  Map<String, dynamic> map = {};
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
      map = json.decode(response.body);
      notifyListeners();
    }else{
      return debugPrint('Error 404');
    }
  }

  mapaString() => map['result']['confirmation'];

  isDataGet() => isData;
}

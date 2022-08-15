import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthUserProvider with ChangeNotifier {
  Map<String, dynamic> map = {};
  bool isData = false;

  Future validar(correo, key) async {
    final response = await http.post(
        Uri.parse('https://eventontime.herokuapp.com/api/auth'),
        body: {"email": correo, "password": key});

    if (response.statusCode == 200) {
      isData = true;
      map = json.decode(response.body);
      notifyListeners();
    }else{
      isData = false;
    }
  }

  mapaString() => map['result'];

  isDataGet() => isData;
}

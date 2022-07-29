import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthEventProvider with ChangeNotifier {

  Map<String,dynamic> map = {};
  bool isData = false; 
  
  Future validar() async {
    final response = await http.post(
        Uri.parse('https://eventontime.herokuapp.com/api/auth/event'),
        body: {"codeEvent": "7935", "codeInvit": "9173"});

    if (response.statusCode == 200) {
      isData = true;
      map = json.decode(response.body);
        notifyListeners();
    }
  }

  mapaString() => map['result'];

  isDataGet() => isData;


}

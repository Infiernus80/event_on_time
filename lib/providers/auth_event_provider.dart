import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthEventProvider with ChangeNotifier {

  Map<String,dynamic> map = {};
  bool isData = false; 
  
  Future validar(int codeEvent, int codeInvite) async {
    final response = await http.post(
        Uri.parse('https://eventontime.herokuapp.com/api/auth/event'),
        body: {"codeEvent": codeEvent.toString(), "codeInvit": codeInvite.toString()});

    if (response.statusCode == 200) {
      isData = true;
      map = json.decode(response.body);
        notifyListeners();
    }
  }

  mapaString() => map['result'];

  isDataGet() => isData;


}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class KeeperGetProvider with ChangeNotifier {
  Map<String, dynamic> map = {};
  bool isData = false;

  Future datosInvitado(String id,token) async {
    final response = await http.get(
      Uri.parse('https://eventontime.herokuapp.com/api/guest/$id'),
      headers: {
        'Authorization': token
      }
    );

    if (response.statusCode == 200) {
      isData = true;
      map = json.decode(response.body);
      notifyListeners();
    }
    else{
      isData = false;
    }
  }

  mapaString() => map['result'];

  isDataGet() => isData;
}

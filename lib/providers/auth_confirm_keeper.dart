import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthConfirmProvider with ChangeNotifier {
  Map map = {};

  Future confirmarAssist(token,id) async {
    final response = await http.put(
        Uri.parse(
            'https://eventontime.herokuapp.com/api/guest/$id/assitence'),
        headers: {
          "Authorization": token,
        });

    if (response.statusCode == 200) {
      map = json.decode(response.body);
      notifyListeners();
    } else {
      debugPrint('fallo');
    }
  }

  get mapaString => map['result'];

}

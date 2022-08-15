import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthStadisticUserProvider with ChangeNotifier {
  Map map = {};

  Future getStadistic(token) async {
    final response = await http.get(
        Uri.parse(
            'https://eventontime.herokuapp.com/api/stadistic/dashboard/planner/movil'),
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

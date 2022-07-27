import 'dart:convert';

import 'package:event_on_time/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthEventService with ChangeNotifier{
  final String _baseUrl = 'eventontime.herokuapp.com/api';
  final String _token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2MmUwOTlhYzU4OTUzNTIyNTdhOWVjN2EiLCJpYXQiOjE2NTg5MzMyNzksImV4cCI6MTY1ODk0NzY3OX0.9XljD5qbHW_A77JU6khUdAhTn_R4cx9Kw-05QAaGhNo';

  Future authEvent(String reunion, String user) async{
    reunion = '7935';
    user = '9173';
    final response = await http.post(
      Uri.parse('https://eventontime.herokuapp.com/api/auth/event'),
      headers: {
        'Authorization': _token
      },
      body: {
        'codeEvent':reunion,
        'codeInvit':user,
      }
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      debugPrint('$map}');
      return map;
    } else {
      debugPrint('Fallo');
      throw Exception('Error');
    }
  }

  
}
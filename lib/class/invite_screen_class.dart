import 'package:flutter/material.dart';


class ScreenArguments with ChangeNotifier{
  static int _numeros = 1;

  get numeroInviteGet{
    int numero = _numeros;
    return numero;
  }
  
  set numeroInviteSet(int numero){
    _numeros = numero;
    notifyListeners();
  }
}
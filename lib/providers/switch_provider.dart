import 'package:flutter/material.dart';

class SwitchProvider with ChangeNotifier{
  bool isNotifiable = false;

  bool get isInvitateGet=> isNotifiable;

  isInvitateSet(){
    isNotifiable = !isNotifiable;
    notifyListeners();
  }
}
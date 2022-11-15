import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {
  String _opcion = "";

  String get opcion => _opcion;

  void filloption(String opt) {
    _opcion = opt;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}

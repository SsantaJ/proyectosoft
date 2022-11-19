import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {
  String _opcion = "";
  String _pay = "";
  bool _Empty = false;
  late int _subtotal;

  String get opcion => _opcion;
  String get pay => _pay;
  bool get Empty => _Empty;
  int get subtotal => _subtotal;

  void filloption(String opt) {
    _opcion = opt;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void selectPay({bool cash = false, int can = 0}) {
    if (cash) {
      _pay = can.toString();
    } else {
      _pay = "Con tarjeta";
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void calcSubTotal({required String uid}) async {
 QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance.collection("User").doc(uid).collection("Cart").get();
 _subtotal = 0;
 if(query.docs.isEmpty){
  _subtotal = 0;
 }
  else{
    for(var item in query.docs){
      int can = item["Cantidad"];
      int precio = int.parse(item["Precio"]);
      _subtotal = _subtotal +(precio*can);
    }
  }
    print(_subtotal);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void checkEmpty({required String uid}) async {
    QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
        .collection("User")
        .doc(uid)
        .collection("Cart")
        .limit(1)
        .get();
    if (query.docs.isEmpty) {
      _Empty = true;
    } else {
      _Empty = false;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}

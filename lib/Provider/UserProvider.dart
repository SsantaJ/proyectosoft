import 'package:proyectosoft/model/custom_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectosoft/db/database.dart';

class UserProvider with ChangeNotifier {
  final CustomUser _customUser = CustomUser(
    uid: '',
    email: '',
    userName: '',
  ); //Nuestro objeto a llenar, se encuentra en la carpeta model, es nuestro objeto User (le puse Custom antes porque FirebaseAuth tiene ya una clase User)

  CustomUser get customUser => _customUser; //getter simple

  void setLoginData(User user) {
    _customUser.email = user.email ?? '';
    _customUser.uid = user.uid;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void fillUserFromDB(String uid) async {
    //Esto usa una función en Database para consultar la info de 1 user, en este caso del user logueado, todo ello a través del uid
    await Database.getUser(id: uid).then((user) {
      //Como es un Future le puedo decir (con .then()) que una vez termine la función haga otra cosa
      _customUser.email = user.email;
      _customUser.uid = user.uid;
      _customUser.userName = user.userName ?? '';
      //en este caso llenamos los datos del user
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners(); //Y obvio notificamos cambios
    });
  }

  void fillUserData(CustomUser user) async {
    _customUser.email = user.email;
    _customUser.uid = user.uid;
    _customUser.userName = user.userName ?? '';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void clearData() {
    //Esto es simplemente para dejar el user en blanco cuando cierren sesión
    _customUser.email = '';
    _customUser.uid = '';
    _customUser.userName = '';
    notifyListeners();
  }
}

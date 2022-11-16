import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:provider/provider.dart';

import '../Model/custom_user.dart';
import '../db/database.dart';

class CustomAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Stream<User?> streamFirebase() {
    //Este es el stream
    final streamAuth = FirebaseAuth.instance.authStateChanges();
    return streamAuth;
  }

  static Future<void> registerWithEmailAndPassword({
    //nuestro método para REGISTRAR (PD: Loguea automáticamente en caso satisfactorio, ya que el Stream detecta data)
    required String email,
    required String pass,
    required String userName,
    required BuildContext context,
  }) async {
    late User? user;
    try {
      user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      ))
          .user;
    } catch (error) {
      user = null;
      log(error.toString());
    }
    if (user != null) {
      CustomUser _user = CustomUser(
        uid: user.uid,
        email: email,
      );
      //LLenamos datos en el provider fácil con lo que traemos de la vista de registro
      context.read<UserProvider>().fillUserData(_user);
      //Añadimos el user a la base de datos
      await Database.addUser(user: _user);
    }
  }

  static Future<void> signInWithEmailAndPassword({
    //Nuestra función para INICIAR SESIÓN
    required String email,
    required String pass,
    required BuildContext context,
  }) async {
    late User? user;
    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      ))
          .user;
    } catch (error) {
      user = null;
      log(error.toString());
    }

    if (user != null) {
      //LLenamos datos desde DB porque NO tenemos forma de traer los otros datos
      context.read<UserProvider>().fillUserFromDB(user.uid);
    }
  }

  static signOut({required BuildContext context}) async {
    //La función más fácil del universo, para cerrar sesión. El Stream auto detecta que no hay más data
    await _auth.signOut();
    //Limpiamos la data del provider
    context.read<UserProvider>().clearData();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

import '../model/custom_user.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainProductsCollection =
    _firestore.collection('Productos');
final CollectionReference _mainUserCollection = _firestore.collection('User');
var user = FirebaseAuth.instance.currentUser!;
var uid = user.uid;
final CollectionReference cartCollection = _mainUserCollection.doc(uid).collection('Cart');

class Database {
  static String? userUid;

  static Future<void> addUser({
    //Pedimos un objeto de tipo CustomUser para meterlo en la DB
    required CustomUser user,
  }) async {
    //Hacemos una DocumentReference pues queremos crear un documento, y le pasamos el ID (ese ID se metió antes en el user auto desde FirebaseAuth)
    DocumentReference documentReferencer = _mainUserCollection.doc(user.uid);

    //Mapeamos los datos para que Firebase los entienda
    Map<String, dynamic> data = <String, dynamic>{
      'email': user.email,
      'uid': user.uid,
    };

    //Mandamos la función .set que es la que envía los datos
    await documentReferencer
        .set(data)
        .whenComplete(() => log("User agregado correctamente a la DB"))
        .catchError((e) => log(e));
  }

  static Future getUser({required String id}) async {
    //En esta solo necesitamos el ID para ir a buscarlo a la db
    //Nuevamente hacemos un DocumentReference y le decimos q busque el doc con el id
    DocumentReference documentReference = _mainUserCollection.doc(id);
    //Creamos una nueva instancia de CustomUser que es la que devolveremos
    CustomUser customUser = CustomUser(uid: id);
    await documentReference.get().then(
      //Ya sabemos que con .then() podemos hacer algo después de que la función termine
      //En este caso nos devuelve una DocumentSnapshot
      (DocumentSnapshot doc) {
        //Mapeamos esa data del snapshot para que sea más fácil sacarle los campos específicos
        final data = doc.data() as Map<String, dynamic>;
        customUser.email = data['email'];
      },
    );
    //Devolvemos un objeto User full instanciado
    return customUser;
  }

  static Stream<QuerySnapshot> readItems(String opc) {
    CollectionReference bebidasItemCollection =
        _mainProductsCollection.doc('Productos').collection(opc);
    return bebidasItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readCart() {
    CollectionReference cartItemCollection =
        cartCollection;
    return cartItemCollection.snapshots();
  }

  static Future<void> addItem({required String Img, required String Nombre, required String Precio}) async {
    DocumentReference documentReferencer =
        cartCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "Nombre": Nombre,
      "Precio": Precio,
      "Img": Img,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => log("item added to the cart"))
        .catchError((e) => log(e));
  }
}

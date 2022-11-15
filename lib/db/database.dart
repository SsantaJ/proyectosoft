import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

import '../model/custom_user.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainProductsCollection =
    _firestore.collection('Productos');
final CollectionReference _mainDrinksCollection =
    _firestore.collection('Bebidas');
final CollectionReference _mainUserCollection = _firestore.collection('User');

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


  static Future<void> setFirstData() async {
    List colecciones = ['bebidas', 'platos', 'postres'];

    DocumentReference documentReferencer =
        _mainProductsCollection.doc("bebidas");

    Map<String, dynamic> data = <String, dynamic>{
      "nombre": "Algo",
      "precio": "45000",
      'tamaño': '10kg'
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> addItem(
      {required String title, required String note}) async {
    DocumentReference documentReferencer =
        _mainProductsCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "note": note,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem(
      {required String title,
      required String note,
      required String docId}) async {
    DocumentReference documentReferencer =
        _mainProductsCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "note": note,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems(String opc) {
    CollectionReference bebidasItemCollection =
        _mainProductsCollection.doc('Productos').collection(opc);
    return bebidasItemCollection.snapshots();
  }

  static Future<void> deleteItem({required String docId}) async {
    DocumentReference documentReferencer =
        _mainProductsCollection.doc(userUid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}

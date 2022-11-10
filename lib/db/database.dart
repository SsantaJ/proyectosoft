import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainProductsCollection = _firestore.collection('Productos');
final CollectionReference _mainDrinksCollection = _firestore.collection('Bebidas');
final CollectionReference _mainUserCollection = _firestore.collection('User');

class Database {
  static String? userUid;

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

  static Stream<QuerySnapshot> readItems() {
    CollectionReference bebidasItemCollection = _mainProductsCollection.doc('Productos').collection('Bebidas');
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

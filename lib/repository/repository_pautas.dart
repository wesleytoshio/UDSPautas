import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pautas_app/models/pauta_model.dart';

class RepositoryPautas {
  static Future<void> add(Pauta pauta) async {
    CollectionReference _collection = Firestore.instance.collection('pautas');
    await _collection.add(pauta.toMap());
  }

  static Future<void> update(String documentId, Pauta pauta) async {
    CollectionReference _collection = Firestore.instance.collection('pautas');
    await _collection.document(documentId).updateData(pauta.toMap());
  }

  static Future<void> delete(String documentId) async {
    CollectionReference _collection = Firestore.instance.collection('pautas');
    await _collection.document(documentId).delete();
  }

  static Future<Pauta> getPauta(String documentId) async {
    CollectionReference _collection = Firestore.instance.collection('pautas');
    DocumentSnapshot snapshot = await _collection.document(documentId).get();
    return Pauta.fromMap(snapshot);
  }

  static Future<List<Pauta>> getAllPautas(String status) async {
    CollectionReference _collection = Firestore.instance.collection('pautas');
    List<Pauta> list = [];

    QuerySnapshot snapshot =
        await _collection.where('status', isEqualTo: status).snapshots().first;

    snapshot.documents.forEach((f) {
      list.add(Pauta.fromMap(f));
    });
    return list;
  }

  static Future<StreamSubscription<QuerySnapshot>> listenPautas(
      String status, List<Pauta> lista) async {
    return Firestore.instance
        .collection('pautas')
        .where("status", isEqualTo: status)
        .snapshots()
        .listen((data) {
      data.documents.forEach((f) {
        lista.add(Pauta.fromMap(f));
      });
      return lista;
    });
  }
}

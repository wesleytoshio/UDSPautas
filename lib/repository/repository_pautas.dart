import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pautas_app/models/pauta_model.dart';

class RepositoryPautas {
  static CollectionReference _collection =
      Firestore.instance.collection('pautas');

  static Future<void> add(Pauta pauta) async =>
      await _collection.add(pauta.toMap());

  static Future<void> update(String documentId, Pauta pauta) async =>
      await _collection.document(documentId).updateData(pauta.toMap());

  static Future<Pauta> getPauta(String documentId) async {
    DocumentSnapshot snapshot = await _collection.document(documentId).get();
    return Pauta.fromMap(snapshot);
  }

  static Future<List<Pauta>> getAllPautas(String status) async {
    List<Pauta> list = [];

    QuerySnapshot snapshot = await _collection.where('status', isEqualTo: status).snapshots().first;
    
    snapshot.documents.forEach((f) {
      list.add(Pauta.fromMap(f));
    }); 
    return list;
  }
}

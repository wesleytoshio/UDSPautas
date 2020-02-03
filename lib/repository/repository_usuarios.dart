import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pautas_app/classes/class_retorno.dart';
import 'package:flutter/services.dart';
import 'package:pautas_app/models/usuario_model.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RepositoryUsuarios {
  static Future<RetornoApp> entrarUsuario(String email, String senha) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: senha);
      final FirebaseUser user = result.user;

      assert(user != null);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      return RetornoApp(message: 'Ok', status: true, object: currentUser.uid);
    } on PlatformException catch (e) {
      return RetornoApp(message: e.code, status: false, object: e);
    }
  }

  static Future<RetornoApp> registrarUsuario(String email, String senha, String nome) async {
    try {
      CollectionReference _collection = Firestore.instance.collection('usuarios');
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      final FirebaseUser user = result.user;

      assert(user != null);
      assert(await user.getIdToken() != null);
      
      _collection.add(Usuario(nome: nome, uidUsu: user.uid, email: user.email).toMap());

      return RetornoApp(message: 'Ok', status: true, object: user);
    } on PlatformException catch (e) {
      return RetornoApp(message: e.code, status: false, object: e);
    }
  }

  static Future<RetornoApp> logoutUsuario() async {
    try {
      _auth.signOut();
      return RetornoApp(message: 'Ok', status: true, object: null);
    } on PlatformException catch (e) {
      return RetornoApp(message: e.code, status: false, object: e);
    }
  }

  static Future<Usuario> getUsuario(String email) async {
    CollectionReference _collection = Firestore.instance.collection('usuarios');
    QuerySnapshot snapshot = await _collection.where('email', isEqualTo: email).snapshots().first;
    return Usuario.fromMap(snapshot.documents[0]);
  }

  static Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
}
}

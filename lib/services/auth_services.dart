import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AuthState { authenticated, unauthenticated }

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  AuthState _authState = AuthState.unauthenticated;

  AuthService() {
    _auth.authStateChanges().listen((user) {
      _user = user;
      _authState = user == null ? AuthState.unauthenticated : AuthState.authenticated;
      notifyListeners();
    });
  }

  User? get user => _user;
  AuthState get authState => _authState;

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

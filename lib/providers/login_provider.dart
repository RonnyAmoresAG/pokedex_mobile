import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex_mobile/auth_service.dart';

class LoginProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  User? get user => _user;

  Future<void> login(String email, String password) async {
    _user = await _authService.signInWithEmailAndPassword(email, password);
    notifyListeners();
  }
}

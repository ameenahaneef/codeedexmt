import 'dart:developer';

import 'package:codeedexmt/data/sources/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:codeedexmt/data/services/api_service.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  Future<void> login(String email, String password) async {
    try {
      await loginUser(email, password);
      _isLoggedIn = true;
      await SharedPrefsHelper.saveLoginState(true);
      notifyListeners();
    } catch (error) {
      log(error.toString());
      _isLoggedIn = false;
    }
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    await SharedPrefsHelper.saveLoginState(false);
    notifyListeners();
  }
}

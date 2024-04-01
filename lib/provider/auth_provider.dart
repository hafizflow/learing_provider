import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class AuthProvider extends ChangeNotifier {
  void login(String email, String password) async {
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        log('Login Successful');
      } else {
        log('Login Failed, statusCode: ${response.statusCode}');
      }
    } catch (e) {
      log('Login Error: $e');
    }
  }
}

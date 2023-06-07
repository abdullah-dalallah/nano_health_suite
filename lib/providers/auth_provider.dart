import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nano_health_suite/data.dart';
import 'package:nano_health_suite/data/getSharedPref.dart';
import 'package:nano_health_suite/data/keys.dart';
import 'package:nano_health_suite/models/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier{
  Login _login = new Login();

  Login get login => _login;
  set login(Login value) {
    _login = value;
  }


  Future<Response<dynamic>> logIn(String email, String password) async {
    const endPoint = '${Data.BaseUrl}/auth/login';

    Map<String,String> Body = <String,String>{};
    Body.putIfAbsent(Keys.usernameKey, () => email);
    Body.putIfAbsent(Keys.passwordKey, () => password);


    var dio = Dio();
    try {
      var response = await dio.post(endPoint,data: Body);
      if(response.statusCode ==200){

        var  json = response.data;
        _login = Login.fromJson(json);
        saveUserDetailsLocally(_login);
      }

      notifyListeners();
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        // print(e);
      }
      return e.response!;
    }
  }

  Future<void> saveUserDetailsLocally(Login user) async {

    SharedPreferences prefs = await GetSharedPref().getSharedPref();
    prefs.setString(Keys.savedLoggedInUserKey, json.encode(user.toJson()));

  }
  Future<String?> getSavedUserDetailsLocally() async {
    // print("load logged in user data...");
    SharedPreferences prefs = await GetSharedPref().getSharedPref();
    if(prefs.getString(Keys.savedLoggedInUserKey,)!="{}" && prefs.getString(Keys.savedLoggedInUserKey,)!=null){
      _login=   Login.fromJson(json.decode(prefs.getString(Keys.savedLoggedInUserKey,)??"{}"));
      notifyListeners();
      return prefs.getString(Keys.savedLoggedInUserKey,);
    }
    return null;

  }
  Future<void> logOutUserDetailsLocally() async {

    SharedPreferences prefs = await GetSharedPref().getSharedPref();
    prefs.setString(Keys.savedLoggedInUserKey, "{}");
    _login=Login();
    notifyListeners();
  }

}
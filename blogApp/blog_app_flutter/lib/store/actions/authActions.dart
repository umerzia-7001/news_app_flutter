import 'dart:math';

import 'package:blog_app_flutter/models/user.dart';
import 'package:blog_app_flutter/screens/auth/login.dart';
import 'package:blog_app_flutter/screens/main_page.dart';
import 'package:blog_app_flutter/screens/home_screen.dart';
import 'package:blog_app_flutter/store/reducer.dart';
import 'package:flutter/material.dart';
import "package:redux/redux.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart';
import '../types.dart';


// Load user details
Future<void> loadUser(
    {required Store<AppState> store,required  BuildContext context, storage}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? _token = prefs.getString("apiToken") ?? null;

  final url = Uri.parse('http://localhost:5000/login/user');
  Map<String, String> headers = {
    "Content-type": "application/json",
    "x-signal-token": _token!
  };

  Response response = await get(url, headers: headers);
  final statusCode = response.statusCode;

  if (statusCode == 400) {
    prefs.remove("apiToken");

    new Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  if (statusCode == 200) {
    // User Info
    Map<String, dynamic> body = json.decode(response.body);
    User user = User(email: body['email'], name: body['name']);
    store.dispatch(new UpdateUserAction(user));

    await Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, MainPage.routeName);
    });
  }
}

// Login a user action
Future<void> login(
    {required Store<AppState> store,
    email,
    password,
    required BuildContext context,
    storage}) async {
  final url = Uri.parse('http://localhost:5000/login');
  Map<String, String> headers = {"Content-type": "application/json"};
  String data = '{"email": "' + email + '", "password": "' + password + '"}';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Response response = await post(url, headers: headers, body: data);

  final statusCode = response.statusCode;

  if (statusCode != 200) {
    final body = json.decode(response.body);

    if (body['msg'] != "") {
      prefs.remove("apiToken");
      store.dispatch(new UpdateErrorAction(body['msg']));
    }
  }

  if (statusCode == 200) {
    final body = json.decode(response.body);

    if (body['user'] != null) {
      store.dispatch(Types.ClearError);

      // Grab Response data
      User user = User(
          name: body["user"]["name"],
          email: body["user"]["email"],
          id: body["user"]["id"]);

      store.dispatch(new UpdateUserAction(user));

      // Grab & Set token to localStorage
      String token = body['token'];
      await prefs.setString("apiToken", "$token");

       Navigator.pushReplacementNamed(context, MainPage.routeName);
    }
  }
}

// Register a user action
Future<void> register(
    {required Store<AppState> store,
    storage,
    name,
    email,
    password,
    cpassword,
    required BuildContext context}) async {
  final url = Uri.parse('http://localhost:5000/users');
  Map<String, String> headers = {"Content-type": "application/json"};
  String data = '{"email": "' +
      email +
      '", "password": "' +
      password +
      '", "name": "' +
      name +
      '", "cpassword": "' +
      cpassword +
      '"}';

  Response response = await post(url, headers: headers, body: data);

  final statusCode = response.statusCode;

  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (statusCode != 200) {
   
    final body = json.decode(response.body);
    print("ERRORRRRRRR");
    print(body['msg']);
    if (body['msg'] != "") {
     
      prefs.remove("apiToken");
      store.dispatch(new UpdateErrorAction(body['msg']));
    }
  }

  if (statusCode == 200) {
      print("RESPONSE");
    dynamic body = json.decode(response.body);
    if (body['user'] != null) {
      // Clear any error
      store.dispatch(Types.ClearError);


      // Grab Response data
      User user = User(

          id: body["user"]["id"],
          name: body["user"]["name"],
          email: body["user"]["email"]
      );
          

      // Grab the token
      String token = body['token'];

      // Set token for localStorage
      await prefs.setString("apiToken", "$token");

      store.dispatch(new UpdateUserAction(user));


      await Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, MainPage.routeName);
      });
    }
  }
}

// Random String generator
String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}
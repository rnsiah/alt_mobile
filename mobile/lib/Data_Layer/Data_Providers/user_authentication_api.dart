import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/Data_Layer/Models/authentication_models/userLogin_model.dart';
import 'package:mobile/Data_Layer/Repoositories/user_repository.dart';

final _base = "http://localhost:8000";
final _loginKeyEndpoint = "/auth/login/";
final _registerKeyEndpoint = '/auth/registration/';

final Uri _signinKeyURL = Uri.parse(_base + _loginKeyEndpoint);
final Uri _registrationKeyURL = Uri.parse(_base + _registerKeyEndpoint);

Future<Key> getKey(UserLogin userLogin) async {
  print(_signinKeyURL);
  final http.Response response = await http.post(
    _signinKeyURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    return Key.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<Key> getKeyFromSignUp(UserSignUpLoginIn userSignUpLoginIn) async {
  print(_registrationKeyURL);
  final http.Response response = await http.post(
    _registrationKeyURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userSignUpLoginIn.toJson()),
  );
  if (response.statusCode == 200) {
    return Key.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
  
}



Future<Key> getKeyFromConfirmation(UserConfirmationModel userConfirmationModel) async {
  print(_registrationKeyURL);
  final http.Response response = await http.post(
    _registrationKeyURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userConfirmationModel.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    return Key.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
  
}


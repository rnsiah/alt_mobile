import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:mobile/Data_Layer/Data_Providers/user_authentication_api.dart';
import 'package:mobile/Data_Layer/Data_Providers/user_profile_api.dart';
import 'package:mobile/Data_Layer/Local%20Storage/user_data_access_object.dart';
import 'package:mobile/Data_Layer/Models/authentication_models/userLogin_model.dart';
import 'package:mobile/Data_Layer/Models/user_model.dart';

class UserRepository {
  final userDao = UserDao();
  final _apiProvider = ApiProvider();

//  Grabs information from login Bloc and and then acccess the user authetntication
// data service which returns a key. Once key is returned, it creates a User object
// from the Key object which hold hte user email, key, and the altrue id , and gives
// a default 0 as id for the local database storage on device
  Future<User> authenticate({
    required String email,
    required String password,
  }) async {
    UserLogin userLogin = UserLogin(email: email, password: password);
    Key key = await getKey(userLogin);
    User user = User(
        id: 0,
        email: key.user.email,
        key: key.key,
        altid: key.user.altid,
        hasProfile: 0);
    await persistToken(user: user);
    return user;
  }

// Function that checks the local Databse on device to return  the altrue Id
// Function is to obtain that id to call for userprofile and other authenticated
// api requests
  Future<int> getAltId(User user) async {
    user = (await userDao.getCurrentUser(0))!;
    int altid = user.altid;
    return altid;
  }

// Function that returns the key of the user that is stored locally to
// access authenticated api requests

  Future<String> getUserkey(User user) async {
    user = (await userDao.getCurrentUser(0))!;
    String key = user.key;
    return key;
  }

// Function that grabs info from sign up bloc and then access the user registration
// api endpoint which will return a key object . Once key object is returned , User object is
// created and saved to local database.

  Future<User> register({
    required String email,
    required String password1,
    required String password2,
  }) async {
    UserSignUpLoginIn userSignUpLoginIn = UserSignUpLoginIn(
        email: email, password: password1, password2: password2);
    Key key = await getKeyFromSignUp(userSignUpLoginIn);
    User user = User(
        email: key.user.email,
        id: 0,
        key: key.key,
        altid: key.user.altid,
        hasProfile: 0);
    await persistToken(user: user);

    return user;
  }

  Future<User> confirmSignUpWithoutConfirmation({
    required String confirmationCode,
    required String email,
  }) async {
    UserConfirmationModel confirmationModel =
        UserConfirmationModel(confirmationCode: confirmationCode, email: email);
    Key key = await getKeyFromConfirmation(confirmationModel);
    User user = User(
        email: key.user.email,
        key: key.key,
        id: 0,
        altid: key.user.altid,
        hasProfile: 0);

    return user;
  }

  Future<void> confirmSignUpWithConfirmation({
    required String email,
    required String passsword,
  }) async {
    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> persistToken({required User user}) async {
    // write token with the user to the database
    await userDao.createUser(user);
  }

  Future<void> deleteToken({required int localid}) async {
    await userDao.deleteUser(localid);
  }

  Future<bool> hasToken() async {
    bool result = await userDao.checkUser(0);
    return result;
  }

  Future<bool> checkIfUserHasProfile() async {
    bool hasProfile = await userDao.checkIfProfileComplete();
    var result = hasProfile ? true : false;
    return result;
  }

  Future<User> updateProfile({
    required User user,
    required ProfileCompletion profile,
  }) async {
    String body = json.encode(profile);

    String keyOfUser = user.key;
    int altId = user.altid;

    final response = await http.patch(
      Uri.parse('http://localhost:8000/api/userprofiles/$altId/'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
         "Authorization": "Token $keyOfUser" 
        
      },
      body: body,
    );

    if (response.statusCode == 204) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      userDao.updateProfile();
      return user;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Did not work');
    }
  }

  Future<Profile> getProfileFromApi({required User user}) async {
    
    
    int id = user.altid;
    String endpoint = '/userprofiles/$id/';

    dynamic response = await _apiProvider.getUserAuthenticatedData(
        endpoint, user.key, id);
    Profile profile = Profile.fromJson(response);
    return profile;
  }
}

class UserConfirmationModel {
  String confirmationCode;
  String email;

  UserConfirmationModel({required this.confirmationCode, required this.email});

  Map<String, dynamic> toDatabaseJson() =>
      {"email": this.email, "confirmationCode": this.confirmationCode};
}

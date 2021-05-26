import 'package:mobile/Data_Layer/Models/user_model.dart';

abstract class SessionState {}

class UnknownSessionState extends SessionState {}

class Unauthenticated extends SessionState {}

class AuthenticatedWithoutProfile extends SessionState {
  User user;
  AuthenticatedWithoutProfile({required this.user});
}

class Authenticated extends SessionState {
  User user;
  Authenticated({required this.user});
}

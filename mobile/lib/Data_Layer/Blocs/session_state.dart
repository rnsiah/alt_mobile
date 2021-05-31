import 'package:mobile/Data_Layer/Models/user_model.dart';

abstract class SessionState {}

class UnknownSessionState extends SessionState {}

class Unauthenticated extends SessionState {}

class AuthtLoading extends SessionState {}

class AuthenticatedWithoutProfile extends SessionState {
  User user;
  AuthenticatedWithoutProfile({required this.user});
}

class Authenticated extends SessionState {
  User user;
  Authenticated({required this.user});
}

class AuthFailure extends SessionState {
  final String message;
  AuthFailure({required this.message});


}

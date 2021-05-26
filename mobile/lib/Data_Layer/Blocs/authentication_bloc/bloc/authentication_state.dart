part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final User user;

  AuthenticationAuthenticated({required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => '{$user.email is logged in}';
}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String message;
  AuthenticationFailure({required this.message});

  @override
  List<Object> get props => [message];
}

import 'dart:async';
import 'dart:core';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/session_event_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/session_state.dart';
import 'package:mobile/Data_Layer/Models/user_model.dart';
import 'package:mobile/Data_Layer/Repoositories/user_repository.dart';

class SessionBLoc extends Bloc<SessionEvent, SessionState> {
  final UserRepository userRepository;

  User user = User(altid: 0, id: 0, key: '', hasProfile: 0, email: '');

  SessionBLoc({required this.userRepository}) : super(UnknownSessionState()) {
    attemptAutoLogin();
  }

  void attemptAutoLogin() async {
    try {
      final sessionOpen = await userRepository.hasToken();
      if (sessionOpen) {
        final User user = (await userRepository.userDao.getCurrentUser(0))!;
        emit(Authenticated(user: user));
      } else
        showAuthProcess();
    } catch (e) {
      print(e); 
    }
  }

  void logInUser({required User user}) {
    user = User(
        altid: user.altid,
        email: user.email,
        key: user.key,
        hasProfile: 0,
        id: user.id);
  }

  void showAuthProcess() => emit(Unauthenticated());

  void showUserProfileComplete({required User loggedInuser}) async {
    user = User(
        hasProfile: loggedInuser.hasProfile,
        id: loggedInuser.id,
        email: loggedInuser.email,
        altid: loggedInuser.altid,
        key: loggedInuser.key);

    emit(AuthenticatedWithoutProfile(user: loggedInuser));
  }

  void showSession(User loggedInUser) async {
    user = User(
        hasProfile: loggedInUser.hasProfile,
        id: loggedInUser.id,
        email: loggedInUser.email,
        altid: loggedInUser.altid,
        key: loggedInUser.key);
    emit(Authenticated(user: user));
  }

  void signOut() {
    userRepository.deleteToken(localid: 0);
    emit(Unauthenticated());
  }

  @override
  Stream<SessionState> mapEventToState(SessionEvent event) async* {
    if (event is Apploaded) {
      yield* _mapAppLoadedToState(event);
    }
    if (event is LoggedIn) {
      yield* _mapUserLoggedInToState(event);
    }
    if (event is LoggedOut) {
      _mapUserLoggedOutToState(event);
    }
  }

  Stream<SessionState> _mapAppLoadedToState(Apploaded event) async* {
    yield AuthtLoading();
    try {
      await Future.delayed(Duration(milliseconds: 700));
      final currentUser = await userRepository.userDao.getCurrentUser(0);
      if (currentUser != null) {
        yield Authenticated(user: currentUser);
      } else {
        yield Unauthenticated();
      }
    } catch (e) {
      yield AuthFailure(message: e.toString());
    }
  }

  Stream<SessionState> _mapUserLoggedInToState(LoggedIn event) async* {
    yield Authenticated(user: event.user);
  }

  Stream<SessionState> _mapUserLoggedOutToState(LoggedOut event) async* {
    signOut();

  }
}

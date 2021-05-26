import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile/Data_Layer/Models/user_model.dart';
import 'package:mobile/Data_Layer/Repoositories/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(AuthenticationUninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState(event);
    }

    if (event is LoggedIn) {
      yield* _mapUserLoggedIntoState(event);
    }

    if (event is LoggedOut) {
      yield* _mapUserLoggedOutToState(event);
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState(AppStarted event) async* {
    yield AuthenticationLoading();

    try {
      await Future.delayed(Duration(milliseconds: 500));
      final currentUser = await _userRepository.userDao.getCurrentUser(0);

      if (currentUser != null) {
        yield AuthenticationAuthenticated(user: currentUser);
      } else {
        yield AuthenticationUnauthenticated();
      }
    } catch (e) {
      yield AuthenticationFailure(message: 'An unknow failure occurred');
    }
  }

  Stream<AuthenticationState> _mapUserLoggedIntoState(LoggedIn event) async* {
    yield AuthenticationAuthenticated(user: event.user);
  }

  Stream<AuthenticationState> _mapUserLoggedOutToState(LoggedOut event) async* {
    await _userRepository.deleteToken(localid: 0);
    yield AuthenticationUnauthenticated();
  }
}

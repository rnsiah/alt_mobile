import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/session_cubit.dart';
import 'package:mobile/Data_Layer/Models/user_model.dart';

enum ValidationState {
  login,
  signup,
  confirmSignUp,
  signUpWithOutConfirmation,
  userProfileIncomplete,
}

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit({required this.sessionBloc}) : super(ValidationState.login);

  SessionBLoc sessionBloc;

  ValidationCredentials? credentials;

  void showLogin() => emit(ValidationState.login);
  void showSignUp() => emit(ValidationState.signup);

  void showConfirmSignUp(
      {required String email, required String password, String? id}) {
    credentials =
        ValidationCredentials(email: email, password: password, id: 0);

    emit(ValidationState.confirmSignUp);
  }

  void logIn(User user) => sessionBloc.logInUser(user: user);

  void showUserProfileCompletion(User user) {
    sessionBloc.showUserProfileComplete(loggedInuser: user);
  }

  void launchSession(User user) => sessionBloc.showSession(user);
}

class ValidationCredentials {
  final String email;
  final String? password;
  final int? id;

  ValidationCredentials({required this.email, this.password, this.id = 0});
}

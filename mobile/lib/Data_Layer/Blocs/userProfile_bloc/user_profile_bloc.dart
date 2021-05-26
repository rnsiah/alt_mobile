import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/session_cubit.dart';
import 'package:mobile/Data_Layer/Blocs/session_state.dart';
import 'package:mobile/Data_Layer/Blocs/userProfile_bloc/user_profile_event.dart';
import 'package:mobile/Data_Layer/Blocs/userProfile_bloc/user_profile_state.dart';
import 'package:mobile/Data_Layer/Blocs/validationCubit.dart';
import 'package:mobile/Data_Layer/Models/user_model.dart';
import 'package:mobile/Data_Layer/Repoositories/user_repository.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserRepository userRepository;

  final SessionBLoc sessionBLoc;
  final ValidationCubit validationCubit;
  UserProfileBloc(
      {required this.userRepository,
      required this.sessionBLoc,
      required this.validationCubit})
      : super(UserProfileUnitialized()) {
    getProfileIfAlreadyCreated();
  }

  Future<dynamic> getProfileIfAlreadyCreated() async {
    var result = await userRepository.checkIfUserHasProfile();
    if (result) {
      User loggedInUser = sessionBLoc.user;
      Profile _profile =
          await userRepository.getProfileFromApi(user: loggedInUser);

      emit(UserProfileCreated(profile: _profile));
    } else {
      emit(UserProfileNotCreated());
    }
  }

  @override
  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    // Launch the User Profile Completion Page In the Initail Sign Up Process
    if (state is UserProfileNotCreated && sessionBLoc.state is Authenticated) {
      // User? user = await userRepository.userDao.getCurrentUser(0);
      // validationCubit.showUserProfileCompletion(user!);
    }
  }
}

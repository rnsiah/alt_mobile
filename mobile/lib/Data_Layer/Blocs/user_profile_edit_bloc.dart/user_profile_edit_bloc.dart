import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/Data_Layer/Blocs/form_submission_status.dart';
import 'package:mobile/Data_Layer/Blocs/session_cubit.dart';
import 'package:mobile/Data_Layer/Blocs/user_profile_edit_bloc.dart/user_profile_edit_event.dart';
import 'package:mobile/Data_Layer/Blocs/user_profile_edit_bloc.dart/user_profile_edit_state.dart';
import 'package:mobile/Data_Layer/Models/user_model.dart';


import 'package:mobile/Data_Layer/Repoositories/user_repository.dart';

class UserProfileEditBloc
    extends Bloc<UserProfileEditEvent, UserProfileEditState> {
  final UserRepository userRepository;
  final SessionBLoc sessionBLoc;

  UserProfileEditBloc({required this.userRepository, required this.sessionBLoc})
      : super(UserProfileEditState());

  @override
  Stream<UserProfileEditState> mapEventToState(
      UserProfileEditEvent event) async* {
    if (event is UserProfileTitleChange) {
      yield state.copyWith(title: event.title);
    } else if (event is UserProfileAddressChange) {
      yield state.copyWith(address: event.address);
    } else if (event is UserProfileZipChange) {
      yield state.copyWith(zip: event.zip);
    } else if (event is UserProfileCountryChange) {
      yield state.copyWith(country: event.country);
    } else if (event is UserProfileCityChange) {
      yield state.copyWith(city: event.city);
    } else if (event is UserProfileDobChange) {
      yield state.copyWith(dob: event.dob);
    } else if (event is UserProfileUsernameChange) {
      yield state.copyWith(username: event.username);
    } else if (event is UserProfileCompleted) {
      yield state.copyWith(formstatus: FormSubmitting());
      try {
        
        User user=await userRepository.updateProfile(
            user: sessionBLoc.user, profile: event.profile);
        await userRepository.userDao.updateProfile();
        sessionBLoc.showSession(user);
      } catch (e) {
        print(e);
        yield state.copyWith(formstatus: SubmissionFaiiled('exception'));
      }
    }
  }
}

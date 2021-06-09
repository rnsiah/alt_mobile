import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/Data_Layer/Blocs/session_cubit.dart';
import 'package:mobile/Data_Layer/Blocs/session_state.dart';
import 'package:mobile/Data_Layer/Models/user_model.dart';
import 'package:mobile/Data_Layer/Repoositories/user_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;
  final SessionBLoc sessionBLoc;

  ProfileBloc({required this.userRepository, required this.sessionBLoc})
      : super(ProfileInitial()) {
    autoUploadProfile();
  }

  autoUploadProfile() async {
    User? user = await userRepository.userDao.getCurrentUser(0);
    if (user != null) {
      try {
        Profile profile = await userRepository.getProfileFromApi(user: user);
        emit(
            ProfileLoaded(profile: profile, status: ProfileStatus.successfull));
      } catch (e) {
        print(e);
      }
    } else {
      emit(ProfileInitial());
    }
  }

  fetchQR(Profile profile) {
    return profile.qrCode;
  }

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is FetchProfile) {
      try {
        User? user = await userRepository.userDao.getCurrentUser(0);
        Profile profile = await userRepository.getProfileFromApi(user: user!);
        yield (ProfileLoaded(
            profile: profile, status: ProfileStatus.successfull));
      } catch (e) {
        print(e.toString());
      }
      yield ProfileLoaded(profile: null, status: ProfileStatus.failure);
    }
    if (event is FetchProfileAutoLogin) {
      yield (ProfileLoaded(
          profile: event.profile, status: ProfileStatus.successfull));
    }
  }
}

part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FetchProfile extends ProfileEvent {}

class LoadQR extends ProfileEvent {
  final Profile profile;
  LoadQR({required this.profile});
}

class FetchProfileAutoLogin extends ProfileEvent {
  final Profile profile;
  FetchProfileAutoLogin({required this.profile});
}

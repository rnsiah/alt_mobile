import 'package:equatable/equatable.dart';

import 'package:mobile/Data_Layer/Models/user_model.dart';

class UserProfileState extends Equatable {
  @override
  
  List<Object> get props => [];
}


class UserProfileUnitialized extends UserProfileState{}


class UserProfileNotCreated extends UserProfileState {}

class UserProfileCreated extends UserProfileState {
  final Profile profile;

  UserProfileCreated({required this.profile});
}

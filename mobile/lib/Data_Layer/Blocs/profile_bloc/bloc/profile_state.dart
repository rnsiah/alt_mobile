part of 'profile_bloc.dart';

enum ProfileStatus { initial, successfull, failure }

abstract class ProfileState extends Equatable {
  ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoaded extends ProfileState {
final Profile? profile;
final ProfileStatus? status;

  ProfileLoaded({this.profile, this.status});

  
}

class ProfileInitial extends ProfileState{}
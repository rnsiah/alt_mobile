import 'package:equatable/equatable.dart';
import 'package:mobile/Data_Layer/Models/atrocity_model.dart';
import 'package:mobile/Data_Layer/Models/non_profit_model.dart';
import 'package:mobile/Data_Layer/Models/shirt_model.dart';
import 'package:mobile/Data_Layer/Models/user_model.dart';

abstract class UserProfileEditEvent extends Equatable {}

class UserProfileUsernameChange extends UserProfileEditEvent {
  final String username;

  UserProfileUsernameChange({required this.username});

  @override
  List<Object> get props => [username];
}

class UserProfileTitleChange extends UserProfileEditEvent {
  final String title;
  UserProfileTitleChange({required this.title});

  List<Object> get props => [title];
}

class UserProfileDobChange extends UserProfileEditEvent {
  final String dob;

  UserProfileDobChange({required this.dob});

  List<Object> get props => [dob];
}

class UserProfileAddressChange extends UserProfileEditEvent {
  final String address;

  UserProfileAddressChange({required this.address});

  @override
  List<Object?> get props => [address];
}

class UserProfileCountryChange extends UserProfileEditEvent {
  final String country;

  UserProfileCountryChange({required this.country});

  List<Object> get props => [country];
}

class UserProfileCityChange extends UserProfileEditEvent {
  final String city;

  UserProfileCityChange({required this.city});

  @override
  List<Object?> get props => [city];
}

class UserProfileZipChange extends UserProfileEditEvent {
  final String zip;

  UserProfileZipChange({required this.zip});

  @override
  List<Object?> get props => [zip];
}

class UserProfileShirtListChange extends UserProfileEditEvent {
  final List<Shirt> shirtList;

  UserProfileShirtListChange({required this.shirtList});

  @override
  List<Object?> get props => [shirtList];
}

class UserProfileAtrocityListChange extends UserProfileEditEvent {
  final List<Atrocity> atrocityList;

  UserProfileAtrocityListChange({required this.atrocityList});

  @override
  List<Object?> get props => [atrocityList];
}

class UserProfileNonProfitListChange extends UserProfileEditEvent {
  final List<NonProfit> nonProfitList;

  UserProfileNonProfitListChange({required this.nonProfitList});

  @override
  List<Object?> get props => [nonProfitList];
}

class UserProfileCompleted extends UserProfileEditEvent {
  final ProfileCompletion profile;

  UserProfileCompleted(
      {required this.profile});
  List<Object> get props => [profile];
}

class UserProfileEditFailure extends UserProfileEditEvent {
  final String error;

  UserProfileEditFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure {error: $error }';
}

import 'package:json_annotation/json_annotation.dart';

import 'atrocity_model.dart';
import 'non_profit_model.dart';
import 'shirt_model.dart';

part 'user_model.g.dart';

abstract class UUser {}

@JsonSerializable()
class UserFromAPI {
  String url;
  String email;
  @JsonKey(includeIfNull: true, name: "first_name")
  String firstname;
  @JsonKey(name: "last_name")
  String lastName;
  @JsonKey(name: "username")
  String userName;
  int id;
  String profile;
  @JsonKey(name: "profile_created")
  bool profileCreated;

  UserFromAPI(
      {required this.email,
      required this.url,
      required this.firstname,
      required this.id,
      required this.lastName,
      required this.profile,
      required this.profileCreated,
      required this.userName});

  factory UserFromAPI.fromJson(Map<String, dynamic> data) =>
      _$UserFromAPIFromJson(data);

  Map<String, dynamic> toJson() => _$UserFromAPIToJson(this);
}

@JsonSerializable()
class User extends UUser {
  int id;
  String email;
  String key;
  int altid;
  int hasProfile;

  User(
      {required this.id,
      required this.key,
      required this.email,
      required this.altid,
      required this.hasProfile});

  int getUserId(User user) {
    return this.altid;
  }

  factory User.fromDatabaseJson(Map<String, dynamic> data) =>
      _$UserFromJson(data);

  Map<String, dynamic> toDatabaseJson() => _$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Profile {
  Profile({
    required this.username,
    required this.user,
    required this.title,
    required this.dob,
    required this.address,
    required this.country,
    required this.city,
    required this.zip,
    required this.qrCode,
    required this.shirtList,
    required this.atrocityList,
    required this.nonProfitList,
  });
  UserFromAPI user;
  String username;
  @JsonKey(includeIfNull: false)
  String title;
  String dob;
  @JsonKey(includeIfNull: false)
  String address;
  @JsonKey(includeIfNull: false)
  String country;
  @JsonKey(includeIfNull: false)
  String city;
  @JsonKey(includeIfNull: false)
  String zip;
  @JsonKey(includeIfNull: false, name: "qr_code_img")
  String qrCode;
  @JsonKey(includeIfNull: false, name: 'shirt_list')
  List<Shirt> shirtList;
  @JsonKey(includeIfNull: false, name: 'atrocity_list')
  List<Atrocity> atrocityList;
  @JsonKey(includeIfNull: false, name: 'nonProfit_list')
  List<NonProfit> nonProfitList;

  factory Profile.fromJson(Map<String, dynamic> data) =>
      _$ProfileFromJson(data);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class ProfileCompletion {
  String username;
  String title;
  String dob;
  String address;
  String city;
  String country;
  String zip;

  ProfileCompletion(
      {required this.username,
      required this.title,
      required this.dob,
      required this.address,
      required this.city,
      required this.country,
      required this.zip});

  factory ProfileCompletion.fromJSon(Map<String, dynamic> data) =>
      _$ProfileCompletionFromJson(data);

  Map<String, dynamic> toJson() => _$ProfileCompletionToJson(this);
}

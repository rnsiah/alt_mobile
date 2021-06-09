import 'package:json_annotation/json_annotation.dart';

part 'userLogin_model.g.dart';

@JsonSerializable()
class UserLogin {
  String email;
  String password;

  UserLogin({required this.email, required this.password});

  Map<String, dynamic> toDatabaseJson() => _$UserLoginToJson(this);
}

@JsonSerializable()
class UserSignUpLoginIn {
  String email;
  String password;
  String? password2;

  UserSignUpLoginIn(
      {required this.email, required this.password, this.password2});

  Map<String, dynamic> toJson() => _$UserSignUpLoginInToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Key {
  String key;
  UserInfoFromKey user;

  Key({required this.key, required this.user});

  factory Key.fromJson(Map<String, dynamic> data) => _$KeyFromJson(data);

  Map<String, dynamic> toJson() => _$KeyToJson(this);
}

@JsonSerializable()
class UserInfoFromKey {
  @JsonKey(name: 'id')
  int altid;
  String email;
  @JsonKey(name: "profile_created")
  bool profileCreated;

  UserInfoFromKey(
      {required this.profileCreated, required this.altid, required this.email});

  factory UserInfoFromKey.fromJson(Map<String, dynamic> data) =>
      _$UserInfoFromKeyFromJson(data);

  Map<String, dynamic> toJson() => _$UserInfoFromKeyToJson(this);
}

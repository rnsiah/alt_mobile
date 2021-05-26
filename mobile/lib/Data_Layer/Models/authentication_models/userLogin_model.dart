
class UserLogin {
  String email;
  String password;

  UserLogin({required this.email, required this.password});

  Map<String, dynamic> toDatabaseJson() =>
      {"email": this.email, "password": this.password};
}

class UserSignUpLoginIn {
  String email;
  String password;
  String? password2;

  UserSignUpLoginIn(
      {required this.email, required this.password, this.password2});

  Map<String, dynamic> toDatabaseJson() => {
        'email': this.email,
        'password1': this.password,
        'password2': this.password2
      };
}

class Key {
  String key;
  UserInfoFromKey user;

  Key({required this.key, required this.user});

  factory Key.fromJson(Map<String, dynamic> json) {
    return Key(key: json['key'], user: UserInfoFromKey.fromJson(json['user']));
  }

     Map<String, dynamic> toJson() => {
        "token": this.key,
        
    };
}

class UserInfoFromKey {
  int altid;
  String email;
  

  UserInfoFromKey({required this.altid, required this.email});

  factory UserInfoFromKey.fromJson(Map<String, dynamic> json) =>
      UserInfoFromKey(
        altid: json['id'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        "id": this.altid,
        "email": this.email,
    };
}

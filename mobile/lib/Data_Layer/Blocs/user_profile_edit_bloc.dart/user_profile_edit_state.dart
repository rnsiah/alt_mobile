import 'package:mobile/Data_Layer/Models/user_model.dart';

import '../form_submission_status.dart';

class UserProfileEditState {
  final User? user;
  final String username;
  final String dob;
  final String title;
  final String address;
  final String country;
  final String city;
  final String zip;

  final FormSubmissionStatus formStatus;

  UserProfileEditState(
      {this.user,
        this.address = '',
      this.username = '',
      this.city = '',
      this.country = '',
      this.dob = '',
      this.title = '',
      this.zip = '',
      this.formStatus = const InitialFormStatus()});

  UserProfileEditState copyWith({
    User? user,
    String? username,
    String? dob,
    String? title,
    String? address,
    String? country,
    String? city,
    String? zip,
    FormSubmissionStatus? formstatus,
  }) {
    return UserProfileEditState(
      user: user?? this.user,
        username: username ?? this.username,
        formStatus: formstatus ?? this.formStatus,
        dob: dob ?? this.dob,
        title: title ?? this.title,
        address: address ?? this.address,
        city: city ?? this.city,
        country: country ?? this.country,
        zip: zip ?? this.zip);
  }
}

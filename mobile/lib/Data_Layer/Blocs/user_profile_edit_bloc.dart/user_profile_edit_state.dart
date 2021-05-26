import '../form_submission_status.dart';

class UserProfileEditState {
  final String username;
  final String dob;
  final String title;
  final String address;
  final String country;
  final String city;
  final String zip;
  

  final FormSubmissionStatus formStatus;

  UserProfileEditState(
      {this.address = '',
      this.username = '',
      this.city = '',
      this.country = '',
      this.dob = '',
      this.title = '',
      this.zip = '',
      this.formStatus = const InitialFormStatus()});
      

  UserProfileEditState copyWith({
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
        formStatus: formstatus ?? this.formStatus,
        dob: dob ?? this.dob,
        title: title ?? this.title,
        address: address ?? this.address,
        city: city ?? this.city,
        country: country ?? this.country,
        zip: zip ?? this.zip);
  }
}

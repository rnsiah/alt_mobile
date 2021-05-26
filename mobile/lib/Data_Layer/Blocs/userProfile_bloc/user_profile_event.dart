
import 'package:mobile/Data_Layer/Models/user_model.dart';

abstract class UserProfileEvent {}



class UserProfileUpdated extends UserProfileEvent {
  final Profile profile;

  UserProfileUpdated({required this.profile});

}



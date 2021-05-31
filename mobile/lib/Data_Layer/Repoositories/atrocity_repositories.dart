import 'package:mobile/Data_Layer/Data_Providers/user_profile_api.dart';
import 'package:mobile/Data_Layer/Models/atrocity_model.dart';

class AtrocityRepository {
  NonAuthenticatedApiProvider _provider = NonAuthenticatedApiProvider();

  Future<List<Atrocity>> getFeaturedAtrocities() async {
    List<Atrocity> atrocities = [];
    final response = await _provider.get('api/featuredatrocities');
    for (var responses in response) {
      atrocities.add(Atrocity.fromJson(responses));
    }
    return atrocities;
  }

  Future<List<Atrocity>> getAtrocities() async {
    List<Atrocity> atrocities = [];
    final response = await _provider.get('api/atrocities');
    for (var responses in response) {
      atrocities.add(Atrocity.fromJson(responses));
    }
    return atrocities;
  }
}

import 'package:mobile/Data_Layer/Data_Providers/user_profile_api.dart';
import 'package:mobile/Data_Layer/Models/shirt_model.dart';


class ShirtRepository {
  NonAuthenticatedApiProvider _provider = NonAuthenticatedApiProvider();

  Future<List<Shirt>> fetchShirtList() async {
    List<Shirt> shirts = [];
   
    final response = await _provider.get('api/shirts');
    for (var responses in response) {
      shirts.add(Shirt.fromJson(responses));
    }
    return shirts;
  }

  Future<Shirt> fetchShirt(int id) async {
    final response = await _provider.get('api/shirts/$id');
    return Shirt.fromJson(response);
  }

  Future<List<Shirt>> fetFeaturedShirts() async {
    List<Shirt> shirts = [];
    final response = await _provider.get('featuredshirts');
    for (var responses in response) {
      shirts.add(Shirt.fromJson(responses));
    }
    return shirts;
  }
}

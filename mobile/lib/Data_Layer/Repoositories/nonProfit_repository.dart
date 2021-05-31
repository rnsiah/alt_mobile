import 'package:mobile/Data_Layer/Data_Providers/user_profile_api.dart';
import 'package:mobile/Data_Layer/Models/non_profit_model.dart';

 class NonProfitRespository {
  NonAuthenticatedApiProvider _provider = NonAuthenticatedApiProvider();

  Future<List<NonProfit>> fetchNonProfits() async {
    List<NonProfit> nonProfitList = [];

    final response = await _provider.get('api/nonprofits');
    for (var nonprofits in response) {
      nonProfitList.add(NonProfit.fromJson(nonprofits));
    }
    return nonProfitList;
  }

  Future<List<NonProfit>> fetchFeaturedNonProfits() async {
    List<NonProfit> nonProfitList = [];
    final response = await _provider.get('/api/featurednonprofits');
    for (var nonprofits in response) {
      nonProfitList.add(NonProfit.fromJson(nonprofits));
    }
    return nonProfitList;
  }
}

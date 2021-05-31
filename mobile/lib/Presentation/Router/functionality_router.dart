import 'package:flutter/material.dart';
import 'package:mobile/Data_Layer/Models/atrocity_model.dart';
import 'package:mobile/Data_Layer/Models/category_model.dart';
import 'package:mobile/Data_Layer/Models/non_profit_model.dart';
import 'package:mobile/Data_Layer/Models/shirt_model.dart';
import 'package:mobile/Presentation/Screens/atrocity_details.dart';
import 'package:mobile/Presentation/Screens/atrocity_list.dart';
import 'package:mobile/Presentation/Screens/cause_details.dart';
import 'package:mobile/Presentation/Screens/cause_list.dart';
import 'package:mobile/Presentation/Screens/non_profit_detail.dart';
import 'package:mobile/Presentation/Screens/nonprofit_list_screen.dart';
import 'package:mobile/Presentation/Screens/shirt_details.dart';
import 'package:mobile/Presentation/Screens/shirts_list.dart';

Widget makeRoute(
    {required BuildContext context,
    required String routeName,
    Object? arguments}) {
  final Widget child =
      _buildRoute(context: context, routeName: routeName, arguments: arguments);
  return child;
}

Widget _buildRoute(
  
    {required BuildContext context,
    required String routeName,
    Object? arguments}) {
  switch (routeName) {
    case '/shirts':
      return ShirtList();
    case '/ShirtDetail':
      Shirt shirt = arguments as Shirt;
      return ShirtDetails(shirt: shirt);
    case '/nonprofits':
      return NonProfitList();
    case '/nonProfitView':
      NonProfit nonProfit = arguments as NonProfit;
      return NonProfitDetails(nonProfit: nonProfit);
    case '/atrocities':
      return AtrocityList();
    case '/atrocityView':
      Atrocity atrocity = arguments as Atrocity;
      return AtrocityDetails(atrocity: atrocity);
    case '/causes':
      return CauseList();
    case '/causeView':
      Category cause = arguments as Category;
      return CauseDetails(cause: cause);
    default:
      throw 'Route $routeName is not defined';
  }
}

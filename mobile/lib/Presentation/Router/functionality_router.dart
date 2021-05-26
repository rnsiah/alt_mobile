import 'package:flutter/material.dart';
import 'package:mobile/Presentation/Screens/atrocity_list.dart';
import 'package:mobile/Presentation/Screens/cause_details.dart';
import 'package:mobile/Presentation/Screens/cause_list.dart';
import 'package:mobile/Presentation/Screens/shirt_details.dart';
import 'package:mobile/Presentation/Screens/shirts_list.dart';

class FunctionalityRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(child: CauseDetails()),
        MaterialPage(child: AtrocityList()),
        MaterialPage(child: ShirtList()),
        MaterialPage(child: CauseList()),
        MaterialPage(child: ShirtDetails()),
        
      ],
    );
  }
}
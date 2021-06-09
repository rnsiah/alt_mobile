// import 'package:flutter/material.dart';

// class NonProfitDetailTabs extends StatelessWidget {
//   static List tabs = [
//       new Tab(text: 'Shirts'),
//       new Tab(text: 'Atrocities'),
//       new Tab(text: 'Volunteer Opportunities')
//     ];
   
//    TabController controller= new TabController(length: tabs.length, vsync: this);

  
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(4),
//       child: Column(
//         children: [
//           Container(
//             color: Colors.black,
//             child: TabBar(
//               controller: _controller,
//               tabs: _tabs,
//               indicatorColor: Colors.amber,
//               unselectedLabelColor: Colors.white,
//             ),
//           ),
//           SizedBox.fromSize(
//             size: Size.fromHeight(300.0),
//             child: TabBarView(
//               controller: _controller,
//               children: _pages,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
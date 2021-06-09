import 'package:flutter/material.dart';
import 'package:mobile/Data_Layer/Models/non_profit_model.dart';

class NonProfitShirtCase extends StatelessWidget {
  final NonProfit nonProfit;

  const NonProfitShirtCase({Key? key, required this.nonProfit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: nonProfit.shirtList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 18,
          crossAxisSpacing: 27,
          childAspectRatio: .75,
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/shirtDetail', arguments: nonProfit.shirtList[index]),
          child: Column(
            children: [ Container(padding:EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Image(image: NetworkImage(nonProfit.shirtList[index].shirtImage, scale: .7)
            ),),Padding(padding: EdgeInsets.symmetric(vertical: 2),
            child: Text(nonProfit.shirtList[index].name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            )],
          ),
        );
      },
    );
  }
}

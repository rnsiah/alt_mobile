import 'package:flutter/material.dart';
import 'package:mobile/Data_Layer/Models/non_profit_model.dart';
import 'package:mobile/Presentation/Widgets/Circular_Clipper.dart';

class NonProfitDetails extends StatelessWidget {
  final NonProfit nonProfit;

  const NonProfitDetails({Key? key, required this.nonProfit}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50, 0.0),
                child: Hero(
                  tag: nonProfit.logo,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(nonProfit.mainImage),
                    ),

                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left:30),
                    onPressed: ()=> Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                  Image(image:AssetImage('images/Altrue Logo White.png'),
                    fit: BoxFit.scaleDown,
                    height: 60,
                    width: 150,),
                  IconButton(
                    padding: EdgeInsets.only(left:20),
                    onPressed: ()=> print('Add to favorites'),
                    icon: Icon(Icons.favorite),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                ],
              ),
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    elevation: 12.0,
                    padding: EdgeInsets.all(10),
                    onPressed: (){},
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      size: 60.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0, left: 20.0,
                child: IconButton(
                  onPressed: ()=> print("I'm Sharing This"),
                  icon: Icon(Icons.share),
                  iconSize: 40.0,
                  color: Colors.black,
                ),
              ),
              Positioned(
                bottom: 0.0, right: 25.0,
                child: IconButton(
                  onPressed: ()=> print("I'm adding This to my list"),
                  icon: Icon(Icons.add),
                  iconSize: 40.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Image(image:NetworkImage(nonProfit.logo), width: 200, height: 100,),
                Text('Year Started:' + nonProfit.yearStarted.toString()),
                SizedBox(height:12),
                Text(
                 nonProfit.name.toUpperCase(),
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),

                Container(
                  height: 250,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child:Column(

                      children: [
                        Text('Mission Statement',textAlign: TextAlign.center, style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            nonProfit.missionStatement,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      SizedBox(height: 15,),
                      Text('Vision Statement',textAlign: TextAlign.center, style: TextStyle(color: Colors.amber,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          nonProfit.visionStatement,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      )
                      ],

                    )

                  ),

                ),
                // NonProfitDetailTabs(nonProfit: widget.nonProfit,)

                //  Expanded(
                //    child: ListView.builder(itemCount: widget.atrocities.category.length,
                //      itemBuilder: (context, index)=>CategoryCard(
                //        category:widget.atrocities.category[index],
                //        press: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Cause_Details(category:widget.atrocities.category[index]))),
                //      ),
                // ),
                //  )



              ],

            ),
          )
        ],
      ),

    );
  }
}

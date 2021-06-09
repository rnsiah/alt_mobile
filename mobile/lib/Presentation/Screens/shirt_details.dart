import 'package:flutter/material.dart';
import 'package:mobile/Data_Layer/Models/shirt_model.dart';
import 'package:mobile/Presentation/Widgets/Circular_Clipper.dart';

class ShirtDetails extends StatelessWidget {

  final Shirt shirt;

  const ShirtDetails({Key? key, required this.shirt}) : super(key: key);


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50, 0.0),
                child: Hero(
                  tag: shirt.originalImage,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(shirt.originalImage),
                    ),

                  ),
                ),
              ), Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left:30),
                    onPressed: ()=> Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30,
                    color: Colors.amber,
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
                    color: Colors.amber,
                  ),
                ],
              ),
              // Positioned.fill(
              //   bottom: 10,
              //   child: Align(
              //     alignment: Alignment.bottomCenter,
              //     child: Container(
              //       height: 200,
              //       width: 200,
              //       child: Image(image: NetworkImage(shirt.shirtImage),),
                   
              //       ),
              //     ),
              //   ),
              
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
            ]),Positioned(
              top: 20,
                          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  
                 
                    
                       Container(
                       width: 300, height: 300,
                       child: Image(
                      fit: BoxFit.contain,
                      image:NetworkImage(shirt.shirtImage),)),
                  
                  Text('REGION:' + shirt.name),
                  SizedBox(height:6),
                  Text(
                    shirt.atrocity[0].title,
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  SizedBox(height: 10),
              ]
              )),
            )]));
  }
}

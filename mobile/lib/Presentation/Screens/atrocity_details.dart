import 'package:flutter/material.dart';
import 'package:mobile/Data_Layer/Models/atrocity_model.dart';
import 'package:mobile/Presentation/Widgets/Circular_Clipper.dart';
import 'package:url_launcher/url_launcher.dart';

class AtrocityDetails extends StatefulWidget {
  final Atrocity atrocity;

  const AtrocityDetails({Key? key, required this.atrocity}) : super();
  @override
  _AtrocityDetailsState createState() => _AtrocityDetailsState();
}

class _AtrocityDetailsState extends State<AtrocityDetails> {

    _launchURL() async {
     var url = widget.atrocity.videoURL;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  
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
                  tag: widget.atrocity.imageUrl,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.atrocity.imageUrl),
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
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    elevation: 12.0,
                    padding: EdgeInsets.all(10),
                    onPressed: ()=>_launchURL(),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      size: 60.0,
                      color: Colors.black
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
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                
                Container(
                   width: 200, height: 150,
                   child: Image(
                  fit: BoxFit.contain,
                  image:NetworkImage(widget.atrocity.country.flag),)),
                Text('REGION:' + widget.atrocity.region.toUpperCase()),
                SizedBox(height:6),
                Text(
                  widget.atrocity.title.toUpperCase(),
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.atrocity.info,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),


              ],

            ),
          )
        ],
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile/Data_Layer/Models/shirt_model.dart';

class ShirtDetails extends StatefulWidget {

  final Shirt shirt;

  const ShirtDetails({Key? key, required this.shirt}) : super(key: key);
  @override
  _ShirtDetailsState createState() => _ShirtDetailsState();
}

class _ShirtDetailsState extends State<ShirtDetails> {
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

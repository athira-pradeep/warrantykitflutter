import 'package:flutter/material.dart';

class CustominputField extends StatelessWidget{

  String hintText;
  CustominputField(this.hintText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Material(
//      elevation: 5.0,
//      borderRadius: BorderRadius.all(Radius.circular(15.0)),
//      color: Colors.white,
      child: TextField(
        decoration: const InputDecoration(
            labelText: "username",
        ),
//        style: TextStyle(
//            fontSize: 20.0,
//            color:Colors.black
//
//        ),
      ),


    );
  }
}
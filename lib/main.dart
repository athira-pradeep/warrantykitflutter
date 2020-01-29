
import 'dart:async';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


void main(){
  runApp(MaterialApp(
    title: "Warrantykit",
    home:Homescreen(),


  ));
}

class Homescreen extends StatelessWidget{

  bool _obscureText = true;

  String _password;
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
//                CustominputField('Username'),
//                CustominputField('Password'),
              new TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  icon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(Icons.supervised_user_circle),
                  
                  ),
                ),
                
              ),
                new TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      icon: const Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: const Icon(Icons.lock))),
                  validator: (val) => val.length < 6 ? 'Password too short.' : null,
                  onSaved: (val) => _password = val,
                  obscureText: _obscureText,
                ),
                Container(
                  width: 100,
                  child:RaisedButton(onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => dashboard()),
                    );

                  },color:Colors.white,textColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Text('Login',style: TextStyle(
                    fontSize: 20,
                  ),
                  ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }



}






class dashboard extends StatelessWidget{


  DateTime _dateTime;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Table Widget")),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child:Container(
            width: 300,
            height: 300,
          child:Table(
            defaultColumnWidth: FixedColumnWidth(150.0),
            border: TableBorder(
              horizontalInside: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 5.0,
              ),
              verticalInside: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1.0,
              ),
            ),


            children: [
              TableRow(
                children: [
                  new Text('Product'),
                  new Text('Expaire date'),
                ],

              ),

            ],

          ),

        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context)=>addproduct()),

          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),

    );
  }

 }


 class addproduct extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
      return productlisted();
  }
}


class productlisted extends State<addproduct>{


  String value="";
  String value1="";
  String value2="";
  DateTime _dateinfo;
  File _image;
  var dt="";
  void open_camera()
  async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image= image;
    });

  }

  void open_gallery()
  async{
    var image= await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image=image;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Add Products",)),
        body: Form(
         child: new ListView(
           padding: const EdgeInsets.symmetric(horizontal: 16.0),
           children: <Widget>[
             new DropdownButton(
                 items: [
                   DropdownMenuItem<String>(
                     value: "one",
                     child: Center(
                       child: Text("one"),
                     ),

                   ),
                   DropdownMenuItem<String>(
                     value: "two",
                     child: Center(
                       child: Text("two"),
                     ),

                   ),
                   DropdownMenuItem<String>(
                     value: "three",
                     child: Center(
                       child: Text("three"),
                     ),

                   ),
                   DropdownMenuItem<String>(
                     value: "four",
                     child: Center(
                       child: Text("four"),
                     ),

                   ),
                   DropdownMenuItem<String>(
                     value: "five",
                     child: Center(
                       child: Text("five"),
                     ),

                   ),

                 ],
                 onChanged: (_value){
                   setState(() {
                     value=_value;

                   });

                 },
               hint: Text("Select Maincategory"),

             ),

             Text(
               "$value",
               style: TextStyle(
                 fontSize: 20.0,
               ),

             ),
             new DropdownButton(
               items: [
                 DropdownMenuItem<String>(
                   value: "one",
                   child: Center(
                     child: Text("one"),
                   ),

                 ),
                 DropdownMenuItem<String>(
                   value: "two",
                   child: Center(
                     child: Text("two"),
                   ),

                 ),
                 DropdownMenuItem<String>(
                   value: "three",
                   child: Center(
                     child: Text("three"),
                   ),

                 ),
                 DropdownMenuItem<String>(
                   value: "four",
                   child: Center(
                     child: Text("four"),
                   ),

                 ),
                 DropdownMenuItem<String>(
                   value: "five",
                   child: Center(
                     child: Text("five"),
                   ),

                 ),

               ],
               onChanged: (_value){
                 setState(() {
                   value1=_value;

                 });

               },
               hint: Text("Select Subcategory"),

             ),

             Text(
               "$value1",
               style: TextStyle(
                 fontSize: 20.0,
               ),

             ),
             new DropdownButton(
               items: [
                 DropdownMenuItem<String>(
                   value: "one",
                   child: Center(
                     child: Text("one"),
                   ),

                 ),
                 DropdownMenuItem<String>(
                   value: "two",
                   child: Center(
                     child: Text("two"),
                   ),

                 ),
                 DropdownMenuItem<String>(
                   value: "three",
                   child: Center(
                     child: Text("three"),
                   ),

                 ),
                 DropdownMenuItem<String>(
                   value: "four",
                   child: Center(
                     child: Text("four"),
                   ),

                 ),
                 DropdownMenuItem<String>(
                   value: "five",
                   child: Center(
                     child: Text("five"),
                   ),

                 ),

               ],
               onChanged: (_value){
                 setState(() {
                   value2=_value;

                 });

               },
               hint: Text("Select Barnd"),

             ),

             Text(
               "$value2",
               style: TextStyle(
                 fontSize: 20.0,
               ),

             ),
             new TextFormField(
               style: TextStyle(fontSize: 20.0),

               decoration: const InputDecoration(
                 labelText: 'Product',
                 hintStyle: TextStyle(fontSize: 20.0),


               ),

             ),


             new FlatButton(

                 child: new Row(
                   children: <Widget>[
                     new Text("Choose Expaire date",style:
                       TextStyle(fontSize: 20.0),),
                     new Icon(Icons.calendar_today),


                   ],


                 ),

               onPressed: () async{
                   final dtPick = await showDatePicker(
                       context: context,
                       initialDate: new DateTime.now(),
                       firstDate: new DateTime(1990),
                       lastDate: new DateTime(2220),
                   );
                  if(dtPick !=null && dtPick != _dateinfo){
                    setState(() {
                      _dateinfo=dtPick;
                    });
                 }
               }


             ),
             Text(
               "$_dateinfo",
               style: TextStyle(fontSize: 20.0),
             ),
             Container(
                  height: 200.0,
                 child:_image == null ? Text("Still waiting ",style: TextStyle(fontSize: 20.0),) : Image.file(_image)),
             Text("Invoice",style: TextStyle(fontSize: 20.0),),
             FlatButton(
                 child: Text("Open Camera"),
                  onPressed: (){
                   open_camera();

                  },
             ),
             FlatButton(
               child: Text("open gallery"),
               onPressed: (){
                 open_gallery();
               },
             ),
             RaisedButton(
               color: Colors.blue,
               child: Text(
                 "Submit",
                 style: TextStyle(color: Colors.white),
               ),
               onPressed: (){
                 print('$value',);
                 _makePutRequest();

               },

             ),





    ],


    ),
    ),


    );



  }

}

 void _makePutRequest() async {
  print("hggvgvhngnvnghm");// set up PUT request arguments
  String url = 'https://jsonplaceholder.typicode.com/posts/1';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"title": "Hello", "body": "body text", "userId": 1}';
  Response respo = await post(url, headers: headers, body: json);
  print(respo);
  int statusCode = respo.statusCode;
  String body = respo.body;


}
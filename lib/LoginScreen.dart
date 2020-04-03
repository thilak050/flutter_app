import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutterapp/HomePage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:intro_slider/slide_object.dart';
import './LoginScreen.dart';
import './HomePage.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:http/http.dart' as http;

import 'PODO/Album.dart';
import 'PODO/User.dart';
import 'package:shared_preferences/shared_preferences.dart';




void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Loginpage(),
  ));
}

class Loginpage extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0, fontWeight: FontWeight.normal );
  final myControlleremail = TextEditingController();
  final myControllerpassword = TextEditingController();
  final myControllerclientcode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final emailField = TextField(
      //obscureText: true,
      style: style,
      controller: myControlleremail,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          prefixIcon: Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.email,
              color: Colors.black,
            ), // icon is 48px widget.
          ),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
        controller: myControllerpassword,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          prefixIcon: Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.vpn_key,
              color: Colors.black,
            ), // icon is 48px widget.
          ),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final clientcode = TextField(
     // obscureText: true,
      style: style,
      controller: myControllerclientcode,

      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Clientcode",
          prefixIcon: Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.code,
              color: Colors.black,
            ), // icon is 48px widget.
          ),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {



              if(myControlleremail.text.isEmpty || myControllerpassword.text.isEmpty ||myControllerclientcode.text.isEmpty )
                {
                  Widget okButton = FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop(); // dismiss dialog

                    },
                  );
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    title: Text("Alert!!"),
                    backgroundColor: Colors.white ,
                    actions: [
                      okButton,
                    ],
                    content: Text("Fields are empty.."),


                  );

                }else{
              //  Future<Album> futureAlbum;

              Future<Void>  futureAlbum= fetchAlbum(context,myControlleremail.text ,
                  myControllerpassword.text,
                  myControllerclientcode.text);





              /*  Widget okButton = FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop(); // dismiss dialog
                  },
                );
                return AlertDialog(
                  title: Text("Alert!!"),
                  backgroundColor: Colors.white ,
                  actions: [
                    okButton,
                  ],
                  // Retrieve the text the that user has entered by using the
                  // TextEditingController.
                  content: Text("Email " + myControlleremail.text + " Password " +
                      myControllerpassword.text + " Clientcode " +
                      myControllerclientcode.text),


                );
*/
              }






        },

        child: Text("LOGIN",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          child: Center(
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/images/logooapp.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(height: 25.0),
                    clientcode,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('my ATOm',textAlign: TextAlign.center, style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14)),
                    Text('Copyright © Agiledge Proccess Solutions Pvt Ltd',textAlign: TextAlign.center, style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14)),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}


/*Future<String> getData() async {

  User creds = new User();
  creds.userName="lakshmi.narayan_r@agiledgesolutions.com";
  creds.password="vish";
  creds.clientCode="agiledge";



  String link =
      "https://jsonplaceholder.typicode.com/todos/1";
  var res = await http
      .post(Uri.encodeFull(link)
     );

 *//* print(res.body);*//*
  if (res.statusCode == 200) {
      // var  token=res.headers.toString();


    var data = json.decode(res.body);
    Fluttertoast.showToast(
        msg: ""+data,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0
    );


  }
return res.toString();
}*/


Future<Void> fetchAlbum(BuildContext context,String username,String password,String clientcode) async {

  User creds = new User();
  creds.userName=username;
  creds.password=password;
  creds.clientCode=clientcode;


  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  Dialogs.showLoadingDialog(context, _keyLoader);
  var url = "https://myatom.app/atom/login";
  final response = await post(Uri.parse(url),
      headers: {
        "Accept": "application/json" , "Content-Type":"application/json"
      },
      body: json.encode(creds),
      encoding: Encoding.getByName("utf-8"));





  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
   /* SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token',  response.headers[HttpHeaders.authorizationHeader].toString());*/
    Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homepage()));
    //Return String
   // String stringValue = prefs.getString('token');

    Fluttertoast.showToast(
        msg: "Login Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0
    );


    return json.decode(response.body);
  }
  else {
    Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();

    Fluttertoast.showToast(
        msg: "Login Failed!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0
    );
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load album');
  }
}


class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
                      ]),
                    )
                  ]));
        });
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import './LoginScreen.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';



void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    check().then((intenet) {
      if (intenet != null && intenet) {
        // Internet Present Case
        Timer(

            Duration(seconds: 5),
                () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Loginpage())));
      }

      Timer(

          Duration(seconds: 5),
              () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => Loginpage())));
      Fluttertoast.showToast(
          msg: "No Internet Connection",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
      );

      Widget okButton = FlatButton(
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
        content: Text("No Internet Connection!!"),


      );




      Fluttertoast.showToast(
          msg: "No Internet Connection",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      // No-Internet Case
    });

  }

  @override
  Widget build(BuildContext context) {


    return Column(

        children: <Widget>[
          //these two

          Expanded(

              child: Container(
                color: Colors.white,
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),

child: Scaffold(

  body: new Container(
    padding: EdgeInsets.all(20),
    alignment: Alignment.center,
    color: Colors.white,


  child: ListView(
  shrinkWrap: true,

  children: <Widget>[Image.asset("assets/images/logooapp.png",width: 150,
      height: 150),
    Text('SECURE AT SOURCE',textAlign: TextAlign.center, style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 18)),

    Text('Loading..',textAlign: TextAlign.center,  style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 14)),

  ],
  ),


  ),




),



              )
          ),


//i cant add child to this???

          Container(
              height: 80,
              color: Colors.red,
           // padding: EdgeInsets.all(20),
            child: Scaffold(

              body: new Container(
                alignment: Alignment.center,
                color: Colors.red,


                child: ListView(
                //  shrinkWrap: true,
                  children: <Widget>[


                    Text('my ATOm™',textAlign: TextAlign.center, style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14)),

                    Text('Powered By Agiledge Process Solutions Pvt Ltd.',textAlign: TextAlign.center,  style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14))],
                ),


              ),




            ),


          ),

        ]
    );


  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
    String _selectedLocation;

    return Scaffold(
      key: key,
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Second Screen"),
       // centerTitle: true,
      ),

      body: Center(

        child:Container(
          padding: EdgeInsets.all(20),

          child: ListView(
            //  shrinkWrap: true,
            children: <Widget>[


          DropdownButton(hint: Text('Please choose a location'), // Not necessary for Option 1
            value: _selectedLocation,
            onChanged: (newValue) {

                _selectedLocation = newValue;
                key.currentState.showSnackBar(new SnackBar(
                  content: new Text("Selection -> "+_selectedLocation),
                ));

            },
            items: _locations.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList()),

              RaisedButton(
                onPressed: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loginpage()));

                  key.currentState.showSnackBar(new SnackBar(
                    content: new Text("Sending Message   "+_selectedLocation),
                  ));
                  // Navigate back to first route when tapped.
                },
                child: Text('Go back!'),
              ),],
          ),

  /*  child: DropdownButton(
    hint: Text('Please choose a location'), // Not necessary for Option 1
    value: _selectedLocation,
    onChanged: (newValue) {
    setState(() {
    _selectedLocation = newValue;
    });
    },
    items: _locations.map((location) {
    return DropdownMenuItem(
    child: new Text(location),
    value: location,
    );
    }).toList(),*/

        ),



      ),
    );
  }
}





/*
class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "ERASER",
        description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "images/photo_eraser.png",
        backgroundColor: Color(0xfff5a623),
      ),
    );
    slides.add(
      new Slide(
        title: "PENCIL",
        description: "Ye indulgence unreserved connection alteration appearance",
        pathImage: "images/photo_pencil.png",
        backgroundColor: Color(0xff203152),
      ),
    );
    slides.add(
      new Slide(
        title: "RULER",
        description:
        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "images/photo_ruler.png",
        backgroundColor: Color(0xff9932CC),
      ),
    );
  }

  void onDonePress() {
    // Do what you want
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}*/
Future<bool> check() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}


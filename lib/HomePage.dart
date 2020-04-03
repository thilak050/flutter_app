import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/History.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:intro_slider/slide_object.dart';
import './LoginScreen.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:http/http.dart' as http;

import 'PODO/Album.dart';
import 'PODO/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Homepage(),
  ));
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body:Column(

          children: <Widget>[
            Container(

                height: 250,
                child: Container(
                  height: 250,
               //   color: Colors.red,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(

                      image: AssetImage('assets/images/cityimage.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: EdgeInsets.all(50),
                  alignment: Alignment.center,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.asset("assets/images/logooapp.png",width: 100, height: 100),
                  Text('Thilak',textAlign: TextAlign.center, style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),

                  Text('Thilak@gmail.com',textAlign: TextAlign.center,  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 16)),
                    ],
                  ),

                )
            ),
            Expanded(

                child: Container(
                  color: Colors.white,
                    height: 80,
                    alignment: Alignment.center,

                    child:  Column(

                      children: <Widget>[

                        Expanded(
                          flex: 2, // 20%

                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[

                              Expanded(
                              flex: 2,


                                child: Card(

                                  elevation: 3,
                                    color: Colors.white,


                                      child: Column(


                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,

                                        children: <Widget>[

                                      Image.asset("assets/images/img_trackcabioc.png",width: 38, height: 38),
                                      Text('Track Cab',textAlign: TextAlign.center, style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14)),
                                        ],
                                      ),













                                ),),
                                Expanded(
                                  flex: 2,
                                  child: Card(

                                    elevation: 3,
                                    color: Colors.white,


                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Image.asset("assets/images/img_scheduleioc.png",width: 38, height: 38),
                                        Text('Scheduling',textAlign: TextAlign.center, style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14)),
                                      ],
                                    ),













                                  ),),
                                Expanded(
                                  flex: 2,
                                  child: Card(

                                    elevation: 3,
                                    color: Colors.white,


                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Image.asset("assets/images/img_bookioc.png",width: 38, height: 38),
                                        Text('Boooking',textAlign: TextAlign.center, style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14)),
                                      ],
                                    ),













                                  ),),
                                Expanded(
                                  flex: 2,




                                  child: Card(

                                    elevation: 3,
                                    color: Colors.white,




                                    child: InkWell(
                                      onTap: () {

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Historypage()));
                                      },
                                    child: Column(

                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,



                                      children: <Widget>[


                                        Image.asset("assets/images/img_historyioc.png",width: 38, height: 38),
                                        Text('History',textAlign: TextAlign.center, style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14)),
                                      ],
                                    ),

                                    ),










                                  ),),


                              ]



                          ),
                        ),


                        Expanded(
                          flex: 7, // 60%

                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[

                                Expanded(
                                  flex: 6,


                                  child: Card(

                                      elevation: 3,

                                      color: Colors.white),),
                                Expanded(
                                  flex: 2,
                                  child: Card(
                                      elevation: 3,
                                      color: Colors.white),
                                ),


                              ]



                          ),
                        ),

                      ],
                    )
                )
            ),
          ]
      ),



      drawer: new Drawer(
          child: new ListView(
              padding: const EdgeInsets.only(top: 0.0),
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                    accountName:  Text("Thilak"),
                    accountEmail:  Text("Thilak@gmail.com"),
                    currentAccountPicture: new CircleAvatar(
                        backgroundColor: Colors.white,
                        child: new Text("TH",style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))

                    ),

                ),
                new ListTile(
                  leading: new Icon(Icons.lightbulb_outline),
                  title: new Text('Notes'),
                  onTap: () => _onListTileTap(),
                ),
                new Divider(),
                new ListTile(
                  leading: new Text('Label'),
                  trailing: new Text('Edit'),
                  onTap: () => _onListTileTap(),
                ),
                new ListTile(
                  leading: new Icon(Icons.label),
                  title: new Text('Expense'),
                  onTap: () => _onListTileTap(),
                ),
                new ListTile(
                  leading: new Icon(Icons.label),
                  title: new Text('Inspiration'),
                  onTap: () => _onListTileTap(),
                ),
                new ListTile(
                  leading: new Icon(Icons.label),
                  title: new Text('Personal'),
                  onTap: () => _onListTileTap(),
                ),
                new ListTile(
                  leading: new Icon(Icons.label),
                  title: new Text('Work'),
                  onTap: () => _onListTileTap(),
                ),
                new ListTile(
                  leading: new Icon(Icons.add),
                  title: new Text('Create new label'),
                  onTap: () => _onListTileTap(),
                ),
                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.archive),
                  title: new Text('Archive'),
                  onTap: () => _onListTileTap(),
                ),
                new ListTile(
                  leading: new Icon(Icons.delete),
                  title: new Text('Trash'),
                  onTap: () => _onListTileTap(),
                ),
                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.settings),
                  title: new Text('Settings'),
                  onTap: () => _onListTileTap(),
                ),
                new ListTile(
                  leading: new Icon(Icons.help),
                  title: new Text('Help & feedback'),
                  onTap: () => _onListTileTap(),
                )
              ]
          )

      ),
      
    );
  }

  methontwo() {

  }
  }

class _onListTileTap {
}





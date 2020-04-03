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
    home: Historypage(),
  ));
}

class Job {
  final int id;
  final String position;
  final String company;
  final String description;

  Job({this.id, this.position, this.company, this.description});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      position: json['position'],
      company: json['company'],
      description: json['description'],
    );
  }
}

class Historypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Second Screen"),
    ),



    );

  }
}
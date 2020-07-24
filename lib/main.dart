import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: JSONTest(),
    );
  }
}

class JSONTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String json =
        '{"name": "John Sm22ith", "email": "john@example.com", "created_time": 123123123123}';

    Map<String, dynamic> userMap = jsonDecode(json);
    //String json을 jsonDecode가 가져와서 Map<String, dynamic>형으로 변환

    var user = User.fromJson(userMap);

    var jsonData = user.toJson();

    return Scaffold(
      body: Center(
          child: Text(
        ' name: ${user.name} \n email: ${user.email} \n created_time: ${user.createdTime} \n toJson: $jsonData',
        textScaleFactor: 2,
      )),
    );
  }
}

class User {
  final String name;
  final String email;
  final int createdTime;

  User(this.name, this.email, this.createdTime);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        createdTime = json['created_time'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'created_time': createdTime,
      };
}

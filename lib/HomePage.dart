import 'dart:math';

import 'package:flutter/material.dart';

import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    var rng = new Random();
    for (var i = 0; i < 5; i++) {
      print(rng.nextInt(listData.length-1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Candidate Technical Assessment"),
      ),
      body: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (BuildContext context, int index) {
            return _cardUser(listData[index]);
          }),
    );
  }

  Widget _cardUser(Map user) {
    return Card(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person, size: 60),
            title: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                user["user"],
                style: TextStyle(fontSize: 20),
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                user['phone'] + "\n" + user['check-in'],
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _getData();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    _addData();
    if (_setUser.length == listData.length) {
      _refreshController.loadNoData();
    } else {
      _refreshController.loadComplete();
    }
  }

  Set<Map> _setUser = Set();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() {
    Set<int> _setRandomIndex = Set();
    while (_setRandomIndex.length != 5) {
      _setRandomIndex.add(Random().nextInt(listData.length - 1));
    }

    _setUser.clear();

    for (int index in _setRandomIndex) {
      print(index);
      _setUser.add(listData[index]);
    }

    setState(() {});
  }

  void _addData() {
    _setUser.clear();

    for (Map user in listData) {
      _setUser.add(user);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Candidate Technical Assessment"),
      ),
      body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Text("pull up load");
              } else if (mode == LoadStatus.loading) {
                body = CupertinoActivityIndicator();
              } else if (mode == LoadStatus.failed) {
                body = Text("Load Failed!Click retry!");
              } else if (mode == LoadStatus.canLoading) {
                body = Text("release to load more");
              } else {
                body = Text("No more Data");
              }
              return Container(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
              itemCount: _setUser.length,
              itemBuilder: (BuildContext context, int index) {
                return _cardUser(_setUser.toList()[index]);
              })),
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

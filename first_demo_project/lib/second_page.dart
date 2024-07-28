import 'package:first_demo_project/Tab/hometab.dart';
import 'package:first_demo_project/Tab/infotab.dart';
import 'package:first_demo_project/Tab/searchtab.dart';
import 'package:first_demo_project/Tab/settingtab.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            "Tabbar",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.home),),
            Tab(icon: Icon(Icons.search),),
            Tab(icon: Icon(Icons.info_outline),),
            Tab(icon: Icon(Icons.settings),),
          ],),
        ),
        body: TabBarView(
          children: [
            HomeTab(),
            Searchtab(),
            InfoTab(),
            SettingTab()
          ],
        ),
      ),
    );
  }
}

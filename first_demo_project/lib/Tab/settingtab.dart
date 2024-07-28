import 'package:flutter/material.dart';

class SettingTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingTabState();
  }
}
class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Setting Page data"),
    );
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTab> {
  List<dynamic> _users = [];
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _users.isNotEmpty
          ? ListView.builder(
        itemCount: _users.length, // Ensure you specify itemCount
        itemBuilder: (context, index) {
          if (index >= _users.length) return Container(); // Prevent index out of range
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Image.network(_users[index]['image']),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _users[index]['firstName'] ?? 'No Name',
                    ),
                    Text(
                      _users[index]['email'] ?? 'No Email',
                    ),
                    Text(
                      _users[index]['phone'] ?? 'No Phone',
                    ),
                  ],
                )
              ],
            ),
          );
        },
      )
          : Center(
        child: _loading
            ? CircularProgressIndicator()
            : ElevatedButton(
          child: Text("Load users"),
          onPressed: loadUserList,
        ),
      ),
    );
  }

  void loadUserList() async {
    setState(() {
      _loading = true;
    });
    try {
      var res = await http.get(Uri.https("dummyjson.com", "users"));
      if (res.statusCode == 200) {
        var jsonData = jsonDecode(res.body);
        setState(() {
          _users = jsonData['users'] ?? []; // Safeguard against null
          _loading = false;
        });
      } else {
        // Handle the error
        print('Failed to load users: ${res.statusCode}');
        setState(() {
          _loading = false;
        });
      }
    } catch (e) {
      // Handle any other exceptions
      print('Error occurred: $e');
      setState(() {
        _loading = false;
      });
    }
  }
}

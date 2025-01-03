import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GettingAPI(),
    );
  }
}

class GettingAPI extends StatelessWidget {
  void ApiGeter() async {
    var url = Uri.parse("https://dummyjson.com/quotes");
   var response = await http.get(url);

    if (response.statusCode == 200) {
     log(response.body);
    } else {
      log("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
          
            mainAxisAlignment: MainAxisAlignment.center,
            
                children: [
          ElevatedButton(
              onPressed: () {
                ApiGeter();
              },
              child: Text("print api"))
                ],
              ),
        ));
  }
}

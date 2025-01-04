import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fundamental_of_api/Models/qoute_Model.dart';
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

class GettingAPI extends StatefulWidget {
  @override
  State<GettingAPI> createState() => _GettingAPIState();
}

class _GettingAPIState extends State<GettingAPI> {
  DataModel? mData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ApiGeter();
  }

  void ApiGeter() async {
    var url = Uri.parse("https://dummyjson.com/quotes");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      log(response.body);

      var resData = jsonDecode(response.body);

      mData = DataModel.fromJson(resData); // model userd

      setState(() {});
    } else {
      log("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: mData !=null ?  ListView.builder(itemBuilder: (_, index) {
      return ListTile(
        title: Text(mData!.quotes[index].quote),
        subtitle: Text(mData!.quotes[index].author),
        
      );

      
    },

    itemCount: mData!.quotes.length,
    
    ):Container(child: Text("DAta is not available"),)
    );
  }
}

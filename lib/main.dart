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
  DataModel? apiData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ApiGeter();
  }

  Future<DataModel> ApiGeter() async {
    var url = Uri.parse("https://dummyjson.com/posts");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      log(response.body);

      var resData = jsonDecode(response.body);

      apiData = DataModel.fromJson(resData); // model userd

      return apiData!;
    } else {
      log("failed");

      return apiData!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ApiGeter(),
          builder: (context, Snapshot) {
            if (Snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (Snapshot.hasError) {
              return Center(
                child: Text("Error  ${Snapshot.error.toString()}"),
              );
            } else if (Snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (_, index) {
                  return ListTile(
                 //   trailing: ,
                    title: Text("${Snapshot.data!.posts![index].id.toString()} : ${Snapshot.data!.posts![index].title}"),
                 subtitle: Text("Tag: ${Snapshot.data!.posts![index].tags}  Likes : ${Snapshot.data!.posts![index].reactions!.likes}  DisLikes : ${Snapshot.data!.posts![index].reactions!.dislikes}"),  // consern
               //     leading: Text(),

                    
                  );
                },
                itemCount: Snapshot.data!.posts!.length,
              );
            } 
            else {
              return Center(
                child: Text("404"),
              );
            }
          }),
    );
  }
}

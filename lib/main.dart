import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fundamental_of_api/Models/product_Model.dart';
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
    var url = Uri.parse("https://dummyjson.com/products");
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
                itemCount: Snapshot.data!.products!.length,
                itemBuilder: (context, index) {
                  ;
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "title: ${Snapshot.data!.products![index].title}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text("description : ${Snapshot.data!.products![index].description}"),
                          const SizedBox(height: 10),
                          Text("Brand:${Snapshot.data!.products![index].brand}}"),
                          Text("Category: ${Snapshot.data!.products![index].category}"),
                          Text("Price: \$${Snapshot.data!.products![index].price}"),
                          Text(
                              "Discount: ${Snapshot.data!.products![index].discountPercentage}%"),
                          Text(
                              "Status: ${Snapshot.data!.products![index].availabilityStatus}"),
                          Text("SKU: ${"sku"}"),
                          Text("Stock: ${"stock"}"),
                          Text(
                              "Minimum Order Quantity: ${Snapshot.data!.products![index].minimumOrderQuantity}"),
                          const SizedBox(height: 10),
                          Image.network(Snapshot.data!.products![index].images![0]),
                          const SizedBox(height: 10),
                          Text("Rating: ${Snapshot.data!.products![index].rating} stars"),
                          Text(
                              "Reviews: ${Snapshot.data!.products![index].reviews![index].rating} reviews"),
                          Text(
                              "Return Policy: ${Snapshot.data!.products![index].returnPolicy}"),
                          Text(
                              "Shipping Information: ${Snapshot.data!.products![index].shippingInformation}"),
                          Text("Dimensions: ${Snapshot.data!.products![index].dimensions!.height.toString()}  and ${Snapshot.data!.products![index].dimensions!.depth.toString()}"),
                          Text("Weight: ${Snapshot.data!.products![index].weight}"),
                          Text(
                              "Warranty Information: ${Snapshot.data!.products![index].warrantyInformation}"),
                          const SizedBox(height: 10),
                          Wrap(
                            children: Snapshot.data!.products![index].tags!
                                .map<Widget>((tag) => Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Chip(label: Text(tag)),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );

              /* ListView.builder(
                itemBuilder: (_, index) {
                  return ListTile(
                 //   trailing: ,
                    title: Text("${Snapshot.data!.posts![index].id.toString()} : ${Snapshot.data!.posts![index].title}"),
                 subtitle: Text("Tag: ${Snapshot.data!.posts![index].tags}  Likes : ${Snapshot.data!.posts![index].reactions!.likes}  DisLikes : ${Snapshot.data!.posts![index].reactions!.dislikes}"),  // consern
               //     leading: Text(),

                    
                  );
                },
                itemCount: Snapshot.data!.posts!.length,
              );*/
            } else {
              return Center(
                child: Text("404"),
              );
            }
          }),
    );
  }
}

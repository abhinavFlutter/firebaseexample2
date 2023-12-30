import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Ex1 extends StatefulWidget {
  const Ex1({super.key});

  @override
  State<Ex1> createState() => _Ex1State();
}

class _Ex1State extends State<Ex1> {
  @override
  void initState() {
    readData();
    super.initState();
  }

  var isLoading = true;
  final tableUrl = "https://fir-example2-5d0a4-default-rtdb.firebaseio.com/" +
      "eventlistbeach.json";

  var description = [];
  var features = [];
  var price = [];
  var image = [];

  readData() async {
    try {
      final result = await http.get(Uri.parse(tableUrl));

      final data = json.decode(result.body) as Map<String, dynamic>;

      data.forEach((key, value) {
        description.add(value["description"]);
        features.add(value["features"]);
        price.add(value["price"]);
        image.add(value["image"]);
      });

      setState(() {
        isLoading = false;
      });
    }
    catch (e) {
      print(e);

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: description.length,
        itemBuilder: (context, index) {
          return isLoading
              ? CircularProgressIndicator()
              : ListTile(
                  leading: CircleAvatar(
                    child: Image(
                      image: NetworkImage(image[index].toString()),
                    ),
                  ),
                  title: Text("Description: ${description[index]}"),
                  subtitle: Text("Feature : ${features[index]}"),
                  trailing: Text("Price ${price[index].toString()}"),
                );
        },
      ),
    );
  }
}

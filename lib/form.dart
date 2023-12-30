import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Ex2 extends StatefulWidget {
  const Ex2({super.key});

  @override
  State<Ex2> createState() => _Ex2State();
}

class _Ex2State extends State<Ex2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  var isLoading = true;

  final tableUrl = "https://fir-example2-5d0a4-default-rtdb.firebaseio.com/" +
      "eventlistbeach.json";
  var description = [];
  var image=[];

  readData() async {
    final result = await http.get(Uri.parse(tableUrl));
    final data = json.decode(result.body) as Map<String, dynamic>;

    data.forEach((key, value) {
      description.add(value["description"]);
      image.add(value["image"]);
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView.builder(
          itemCount: description.length,
      itemBuilder: (context, index) {
        return isLoading
            ? CircularProgressIndicator()

         : Column(
           children: [
             Container(
              color: Colors.red,
              
              child: Text("${description[index]}"),
        ),
             Container(
               color: Colors.green,width: 100,height: 100,
               child: Image(image: NetworkImage(image[index])),
             )
           ],
         );
      },
    ));
  }
}

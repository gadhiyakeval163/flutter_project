import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyDashScreen extends StatefulWidget {
  const MyDashScreen({super.key});

  @override
  State<MyDashScreen> createState() => _MyDashscreenState();
}

class _MyDashscreenState extends State<MyDashScreen> {
  List<dynamic>? listResponse;

  Future<void> apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      setState(() {
        listResponse = json.decode(response.body) as List<dynamic>;
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (listResponse == null) {
            return const CircularProgressIndicator();
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Image.network(listResponse![index]['image'] as String),
                ),
                Text(listResponse![index]['id'].toString()),
                Text(listResponse![index]['title'].toString()),
                Text(listResponse![index]['price'].toString()),
                Text(listResponse![index]['description'].toString()),
                Text(listResponse![index]['category'].toString()),
              ],
            );
          }
        },
        itemCount: listResponse?.length ?? 0,
      ),
    );
  }
}

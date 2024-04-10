import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyLocalScreen extends StatefulWidget {
  const MyLocalScreen({super.key});

  @override
  State<MyLocalScreen> createState() => _MyLocalscreenState();
}

Map? mapResponse;
List? listResponse;

class _MyLocalscreenState extends State<MyLocalScreen> {
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      setState(() {
        listResponse = json.decode(response.body);
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
      body: Column(
        children: [
          const SizedBox(height: 15),
          const SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButtonContainer(
                    icon: Icons.car_crash, color: Colors.orange, text: 'Cars'),
                IconButtonContainer(
                    icon: Icons.handshake,
                    color: Colors.yellow,
                    text: 'Services'),
                IconButtonContainer(
                    icon: Icons.home, color: Colors.green, text: 'Housing'),
                IconButtonContainer(
                    icon: Icons.people, color: Colors.blue, text: 'Jobs'),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButtonContainer(
                    icon: Icons.money, color: Colors.red, text: 'Money'),
                IconButtonContainer(
                    icon: Icons.home_filled,
                    color: Colors.lightBlue,
                    text: 'Home'),
                IconButtonContainer(
                    icon: Icons.play_for_work_outlined,
                    color: Colors.blueAccent,
                    text: 'Free'),
                IconButtonContainer(
                    icon: Icons.category,
                    color: Colors.lightBlueAccent,
                    text: 'Category'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                          listResponse![index]['image'].toString()),
                    ),
                    Text(listResponse![index]['id'].toString()),
                    Text(listResponse![index]['title'].toString()),
                    Text(listResponse![index]['price'].toString()),
                    Text(listResponse![index]['description'].toString()),
                    Text(listResponse![index]['category'].toString()),
                  ],
                );
              },
              itemCount: listResponse == null ? 0 : listResponse!.length,
            ),
          ),
        ],
      ),
    );
  }
}

class IconButtonContainer extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const IconButtonContainer({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(30),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

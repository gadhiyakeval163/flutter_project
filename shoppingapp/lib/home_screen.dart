import 'package:flutter/material.dart';
import 'package:shoppingapp/bid_screen.dart';
import 'package:shoppingapp/car_screen.dart';
import 'package:shoppingapp/dash_screen.dart';
import 'package:shoppingapp/drawer_screen.dart';
import 'package:shoppingapp/local_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            const SizedBox(
              width: 10,
            ),
            Card(
              color: Colors.white,
              child: Row(
                children: [
                  const Icon(Icons.edit_location),
                  const VerticalDivider(color: Colors.grey),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Search 5miles'),
                      )),
                ],
              ),
            ),
            const SizedBox(width: 15),
            IconButton(
                icon: const Icon(Icons.forward_outlined), onPressed: () {}),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'BID',
              ),
              Tab(
                text: 'LOCAL',
              ),
              Tab(
                text: 'CAR',
              ),
              Tab(
                text: 'DASH',
              ),
            ],
            indicatorColor: Colors.orange,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: const TabBarView(
          children: [
            MyBidScreen(),
            MyLocalScreen(),
            MyCarScreen(),
            MyDashScreen(),
          ],
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}

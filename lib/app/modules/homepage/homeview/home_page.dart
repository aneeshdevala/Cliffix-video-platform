import 'package:cliffix/app/modules/homepage/homeview/widgets/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(
            "assets/cliffixlogp.png",
            height: 100,
          ),
        ),
        title: const Text(
          "Cliffix",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: ProfileWidgets(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

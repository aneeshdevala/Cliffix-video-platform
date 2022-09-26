import 'package:cliffix/app/modules/homepage/homeview/widgets/profile.dart';
import 'package:cliffix/app/modules/loginpage/view_model/api_service/shared_service.dart';
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
            child: Image.asset("assets/cliffixlogp.png"),
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
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: const ProfileWidgets(),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              const Text(
                "HomePage",
                style: TextStyle(fontSize: 20),
              ),
              TextButton(
                  onPressed: () {
                    SharedService.logout(context);
                  },
                  child: Text("LOGOUT"))
            ],
          ),
        ));
  }
}

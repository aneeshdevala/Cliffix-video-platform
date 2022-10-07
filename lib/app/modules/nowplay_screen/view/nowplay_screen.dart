import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NowplayScreen extends StatelessWidget {
  const NowplayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.red,
            ),
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.blue,
            ),
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

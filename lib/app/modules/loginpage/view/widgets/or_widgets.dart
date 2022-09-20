import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        SizedBox(
            width: 120,
            child: Divider(
              thickness: 1.5,
            )),
        Text('or'),
        SizedBox(
            width: 120,
            child: Divider(
              thickness: 1.5,
            )),
      ],
    );
  }
}

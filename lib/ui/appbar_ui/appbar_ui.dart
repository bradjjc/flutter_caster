import 'package:flutter/material.dart';

class AppbarUi extends StatelessWidget {
  const AppbarUi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {},
          iconSize: 32,
          color: Colors.white,
        ),
        Text(
          "Jetcaster",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
          iconSize: 32,
          color: Colors.white,
        )
      ],
    );
  }
}

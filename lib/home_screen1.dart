import 'package:flutter/material.dart';

class HomeScreen1 extends StatelessWidget {

  String email;

  HomeScreen1({required this.email,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Email: $email"),

        ],
      ),
    );
  }
}

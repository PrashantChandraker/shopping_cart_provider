import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.all(10),
    child: Column(children: [
      Center(child: Text('Profile'),)
    ],),
    );
  }
}
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.all(10),
    child: Column(children: [
      Center(child: Text('Search'),)
    ],),
    );
  }
}
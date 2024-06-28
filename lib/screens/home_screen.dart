import 'package:flutter/material.dart';
import 'package:shopping_cart_provider/screens/widgets/home_screen_widgets/header_card.dart';
import 'package:shopping_cart_provider/screens/widgets/home_screen_widgets/popular_widget.dart';
import 'package:shopping_cart_provider/screens/widgets/home_screen_widgets/top_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedindex =0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      
      body: SingleChildScrollView(
        child:  Column(
          children: [
            headerWidget(),
            Popularwidget(),
            TopItemWidget(),
          ],
        ),
      ),
     
     
     
    );
  }
}

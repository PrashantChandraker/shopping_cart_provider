import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_provider/provider/cart_provider.dart';
import 'package:shopping_cart_provider/provider/internet_provider.dart';
import 'package:shopping_cart_provider/screens/no_internet_screen.dart';

import '../data/fruits_data.dart';
import '../provider/navigation_controller.dart';
import 'cart_screen.dart';
import '../utils.dart/app_enums.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<NavigationController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(137, 0, 255, 187),
        shadowColor: Colors.grey,
        elevation: 5,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/profile_images/prashant.jpg"),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hii Prashant",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            Text(
              "Good Morning",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications,
                  size: 30, color: Colors.pink)),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartScreen())),
            child: Badge(
              backgroundColor: Colors.blueGrey,
              alignment: Alignment.topRight,
              label: Consumer<CartProvider>(
                  builder: (context, priceChanger, child) =>
                      Text(cartitems.length.toString())),
              child: Icon(
                Icons.shopping_bag,
                size: 30,
                color: Colors.pink,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(137, 0, 255, 187),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 30,
            ),
            label: 'Home',
            backgroundColor: Color.fromARGB(137, 0, 255, 187),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            label: 'Search',
            backgroundColor: Color.fromARGB(135, 75, 53, 94),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              color: Colors.black,
              size: 30,
            ),
            label: 'loaction',
            backgroundColor: Color.fromARGB(135, 73, 33, 49),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
              size: 30,
            ),
            label: 'profile',
            backgroundColor: Color.fromARGB(255, 103, 124, 0),
          ),
        ],

        currentIndex: controller.selectedIndex,
        onTap: (index) => controller.selectedIndex = index,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
      ),
      body: Consumer<InternetProvider>(
        builder:
            ( context,  internetProvider, child){
            return   internetProvider.internetStatus==NetworkStatus.disconnected?const NoInternetScreen():IndexedStack(
          index: controller.selectedIndex,
          children: controller.screens,
        );
            }
       
      ),
    );
  }
}

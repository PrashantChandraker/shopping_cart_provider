import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_provider/provider/cart_provider.dart';
import 'package:shopping_cart_provider/provider/navigation_controller.dart';
import 'package:shopping_cart_provider/screens/navigation_menu.dart';
import 'package:shopping_cart_provider/provider/internet_provider.dart';
import 'package:toast/toast.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => NavigationController()),
       
        ChangeNotifierProvider(create: (_)=> CartProvider()),

        ChangeNotifierProvider(create: (_)=>InternetProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Navigation App',
        home: NavigationMenu(),
      ),
    );
  }
}
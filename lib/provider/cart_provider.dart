import 'package:flutter/material.dart';
import 'package:shopping_cart_provider/data/fruits_data.dart';

class CartProvider extends ChangeNotifier {
  
  late double newprice;


  void updateCart(Fruit cardcomponents) {
    cartitems.add(cardcomponents);
    notifyListeners();
  }

////////////////////////////////////////////////
  ///  Increase Method
  void increaseUnit(Fruit item) {
    /// Increasing the Unit by 1
    item.units = item.units + 1;

    /// Adding item to  CartList
    cartitems.add(item);

    /// Notifying its listeners
    notifyListeners();
  }

////////////////////////////////////////////////////
  /// Decrease Method
  void decreaseUnit(Fruit item) {
    /// Decreasing the Unit by 1
    item.units = item.units - 1;

    /// Checking the condition whether the Unit Decreasing reached to zero
    if (item.units <= 0) {
      /// If True we are remove that item from addToCartList
      cartitems.remove(item);
    } else {
      /// if false we are again adding item to addToCartList
      cartitems.add(item);
    }

    /// Notifying its listeners
    notifyListeners();
  }



}

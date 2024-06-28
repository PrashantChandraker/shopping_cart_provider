import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_provider/data/fruits_data.dart';
import 'package:shopping_cart_provider/provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cart Screen',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(137, 0, 255, 187),
        ),
        body: cartitems.isEmpty
            ? SizedBox(
                height: 500,
                width: 500,
                child: Image.asset('assets/empty.png'),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartitems.length,
                      itemBuilder: (context, index) {
                        final cardcomponent = cartitems.elementAt(index);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            shadowColor: Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child:
                                            Image.asset(cardcomponent.image)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cardcomponent.name,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),

                                      // cardcomponent.newprice==null ?
                                      // Text(
                                      //   '\$ ${cardcomponent.price}',
                                      //   style: const TextStyle(
                                      //       fontSize: 20, fontWeight: FontWeight.w500),
                                      // ) :
                                      Text(
                                        '\$ ${cardcomponent.price * cardcomponent.units}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            cartProvider
                                                .decreaseUnit(cardcomponent);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor:
                                                    Colors.greenAccent,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                content: Text(
                                                  '1 ${cardcomponent.name} removed ☹️',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            );
                                          },
                                          icon:
                                              const Icon(Icons.remove_circle)),
                                      Text(
                                        cardcomponent.units
                                            .toString(), //  cart number for items
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            cartProvider
                                                .increaseUnit(cardcomponent);
                                           ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                  
                                      backgroundColor: Colors.greenAccent,
                                      duration: Duration(milliseconds: 500),
                                      content: Text(
                                          '${cardcomponent.units} ${cardcomponent.name} added 😍', style: TextStyle(color: Colors.black),),
                                    ),
                                  );
                                          },
                                          icon: const Icon(Icons.add_circle)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        // const Color.fromARGB(255, 220, 214, 241),
                        style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(10),
                            shadowColor:
                                MaterialStatePropertyAll(Colors.blueGrey),
                            backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(137, 0, 255, 187),
                            )),
                        onPressed: () {},
                        child: Text(
                          'Pay Now : ${getAmountValue()}',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  String getAmountValue() {
    double totalAmount = 0.0;
    for (int i = 0; i < cartitems.length; i++) {
      totalAmount = totalAmount +
          (cartitems.elementAt(i).units * cartitems.elementAt(i).price);
    }
    // Return value as a String
    return totalAmount.toStringAsFixed(2);
  }
}

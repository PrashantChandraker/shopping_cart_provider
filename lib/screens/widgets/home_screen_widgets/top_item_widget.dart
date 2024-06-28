import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_provider/data/fruits_data.dart';
import 'package:shopping_cart_provider/provider/cart_provider.dart';
import 'package:toast/toast.dart';

class TopItemWidget extends StatefulWidget {
  const TopItemWidget({super.key});

  @override
  State<TopItemWidget> createState() => _TopItemWidgetState();
}

class _TopItemWidgetState extends State<TopItemWidget> {
  @override
  Widget build(BuildContext context) {
    // final cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Top Item',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 5.0,
              ),
              child: Consumer<CartProvider>(
                builder: (context, gridUpdater, child) => GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: fruitList.length,
                  itemBuilder: (context, index) =>
                      FruitsCard(cardcomponent: fruitList[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FruitsCard extends StatelessWidget {
  final Fruit cardcomponent;
  // bool? addButtonPressed;
  FruitsCard({
    super.key,
    required this.cardcomponent,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 90,
              width: 100,
              child: Image.asset(cardcomponent.image, fit: BoxFit.contain),
            ),
            Text(
              cardcomponent.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Price:  \$${cardcomponent.price}',
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Consumer<CartProvider>(
              builder: (context, buttonchanger, child) =>
                  cartitems.contains(cardcomponent)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  cartProvider.decreaseUnit(cardcomponent);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.greenAccent,
                                      duration: Duration(milliseconds: 500),
                                      content: Text(
                                          '1 ${cardcomponent.name} removed ☹️', style: TextStyle(color: Colors.black),),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.remove_circle)),
                            Text(
                              cardcomponent.units
                                  .toString(), //  cart number for items
                              style: const TextStyle(fontSize: 20),
                            ),
                            IconButton(
                                onPressed: () {
                                  cartProvider.increaseUnit(cardcomponent);
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
                        )
                      : Container(
                          height: 40,
                          width: 85,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: () {
                              cartProvider.updateCart(cardcomponent);
                              cartProvider.increaseUnit(cardcomponent);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                   backgroundColor: Colors.greenAccent,
                                  duration: Duration(milliseconds: 500),
                                  content: Text(
                                      '${cardcomponent.name} added 😍', style: TextStyle(color: Colors.black),),
                                ),
                              );
                              // print('object');
                            },
                            child: const Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

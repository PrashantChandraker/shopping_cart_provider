import 'package:flutter/material.dart';

class headerWidget extends StatelessWidget {
  const headerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CategorycardButton(
            fruitname: 'Apple',
            fruitimage: 'assets/fruit_images/apple.png',
          ),
          CategorycardButton(
            fruitname: 'Vegies',
            fruitimage: 'assets/fruit_images/nuts.png',
          ),
          CategorycardButton(
            fruitname: 'Nuts',
            fruitimage: 'assets/fruit_images/tomato.png',
          ),
        ],
      ),
    );
  }

  Widget CategorycardButton({
    required String fruitname,
    required String fruitimage,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 8,
      child: Container(
        height: 50,
        width: 110,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: Image.asset(fruitimage),
              ),
              Text(
                fruitname,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

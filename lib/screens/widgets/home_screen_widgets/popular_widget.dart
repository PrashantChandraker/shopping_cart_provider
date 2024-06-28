import 'package:flutter/material.dart';

class Popularwidget extends StatelessWidget {
  const Popularwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              Text(
                'See all',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            shadowColor: Colors.grey,
            elevation: 5,
            child: Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/fruit_images/pome.png'),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Pomogranate',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department_rounded,
                            color: Colors.yellow.shade900,
                          ),
                          const Text('223 Calories'),
                        ],
                      ),
                      Row(
                        children: [
                          Card(
                            color: Colors.yellow.shade100,
                            child: SizedBox(
                              height: 30,
                              width: 70,
                              child: Center(
                                child: Text(
                                  'unit 1',
                                  style: TextStyle(
                                      color: Colors.yellow.shade900,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            '₹',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                          const Text(
                            '15.3',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

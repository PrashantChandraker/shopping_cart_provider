Set<Fruit> cartitems = {};
class Fruit{
  final String image;
  final String name;
   double price;
   int units;

 

  Fruit({required this.image,required this.name,required this.price,required this.units,});

}
List<Fruit> fruitList = [
    Fruit(
        image: "assets/fruit_images/apple.png",
        name: "Apple",
        price: 50,
        units: 0,
        
        ),
    Fruit(
        image: "assets/fruit_images/pome.png",
        name: "pomogranate",
        price: 80,
        units: 0),
    Fruit(
        image: "assets/fruit_images/banana.png",
        name: "Banana",
        price: 60,
        units: 0),
    Fruit(
        image: "assets/fruit_images/nuts.png",
        name: "Nuts",
        price: 100,
        units: 0),
    Fruit(
        image: "assets/fruit_images/pineapple.png",
        name: "Pineapple",
        price: 90,
        units: 0),
    Fruit(
        image: "assets/fruit_images/tomato.png",
        name: "Tomatoes",
        price: 40,
        units: 0),
  ];
import 'package:flutter/material.dart';
import 'package:itm_ichtrinkmehr_flutter/Values/Drink.dart';
import 'package:lottie/lottie.dart';

Widget allDrinks(String user_name) {
  return GridView.extent(
    maxCrossAxisExtent: 200,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridList(),
  );
}

Widget _buildAddNewDrink() {
  return Row(children: [
    Image(
      image: AssetImage('assets/pils.png'),
    ),
    Container(
        padding: const EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 4),
        decoration: BoxDecoration(
          color: Colors.black38,
        ),
        child: Text(
          "Neuer Drink",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        )),
  ]);
}

//child: Lottie.asset('assets/questionmark.json'),


List<Widget> _buildGridList() {
  List<Drink> allDrinks = [
    new Drink(1, "bier"),
    new Drink(2, "Radler"),
    new Drink(3, "wein")
  ];

  return List.generate(

      allDrinks.length,
      (index) => Stack(alignment: const Alignment(0, 0.8), children: [
            Image(
              image: AssetImage('assets/pils.png'),
            ),
            Container(
                padding:
                    const EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 4),
                decoration: BoxDecoration(
                  color: Colors.black38,
                ),
                child: Text(
                  allDrinks[index].getDrinkName(),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                )),
   _buildAddNewDrink()
  ]) );
}

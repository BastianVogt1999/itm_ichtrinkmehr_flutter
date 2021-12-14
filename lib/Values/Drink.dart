import 'package:flutter/material.dart';

class Drink {
  int drink_id;
  String drink_name;


  Drink(this.drink_id, this.drink_name){
  }

  int getDrinkId(){
    return drink_id;
  }
  String getDrinkName(){
    return drink_name;
  }
  void setDrinkId(int drink_id){
    this.drink_id = drink_id;
  }
  void setDrinkName(String drink_name){
    this.drink_name = drink_name;
  }
}
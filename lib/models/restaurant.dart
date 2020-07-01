import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import './meal.dart';

class Restaurant {
  final String id;
  final List<String> cuisines;
  final String name;
  final String imageUrl;
  final String websiteUrl;
  final String address;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Restaurant(
      {@required this.id,
      @required this.cuisines,
      @required this.name,
      @required this.imageUrl,
      @required this.websiteUrl,
      @required this.address,
      this.affordability = Affordability.Affordable,
      this.isGlutenFree = false,
      this.isLactoseFree = false,
      this.isVegan = false,
      this.isVegetarian = false});
}

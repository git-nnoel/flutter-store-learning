import 'dart:math';

import 'package:flutter/material.dart';

import '../../Model/product.dart';
import '../Components/interactable_grid.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _Catalog();
}

class _Catalog extends State<Catalog> with SingleTickerProviderStateMixin {
  final List<Product> products = [
    Product(
        name: 'Bardera',
        description: 'Product 1',
        price: 19.99,
        image: '../assets/catalog/donuts/Bardera.png'),
    Product(
        name: 'Belgium',
        description: 'Product 2',
        price: 29.99,
        image: '../assets/catalog/donuts/Belgium.png'),
    Product(
        name: 'Boston Cream',
        description: 'Product 3',
        price: 39.99,
        image: '../assets/catalog/donuts/Boston-Cream.png'),
    Product(
        name: 'Choco-Orange',
        description: 'Product 4',
        price: 49.99,
        image: '../assets/catalog/donuts/Choco-Orange.png'),
    Product(
        name: 'Coffee Special',
        description: 'Product 5',
        price: 59.99,
        image: '../assets/catalog/donuts/Coffee-Special.png'),
    Product(
        name: 'Homer Simpson',
        description: 'Product 5',
        price: 59.99,
        image: '../assets/catalog/donuts/Homer-Simpson.png'),
    Product(
        name: 'Strawberry Candy',
        description: 'Product 5',
        price: 59.99,
        image: '../assets/catalog/donuts/Strawberry-Candy.png'),
    Product(
        name: 'The Ring',
        description: 'Product 5',
        price: 59.99,
        image: '../assets/catalog/donuts/The-Ring.png'),
    Product(
        name: 'Unicorn',
        description: 'Product 5',
        price: 59.99,
        image: '../assets/catalog/donuts/Unicorn.png'),
  ];
  bool isHovered = false;
  Product? hoveredProduct;
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );

    _animation = Tween(begin: 1.0, end: 1.03).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var columnCount = max(min(size.width / 300, 4), 2).toInt();
    return Center(
        child: SizedBox(
      width: columnCount * 300 - 80,
      child: GridView.builder(
        itemCount: products.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(40),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columnCount,
            childAspectRatio: 1.0,
            crossAxisSpacing: 60,
            mainAxisSpacing: 60),
        itemBuilder: (BuildContext context, int index) {
          return InteractableGridItems(
              controller: _controller,
              animation: _animation,
              item: products[index]);
        },
      ),
    ));
  }
}

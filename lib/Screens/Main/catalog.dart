import 'package:flutter/material.dart';

import '../../Model/product.dart';

class Catalog extends StatelessWidget {
  Catalog({super.key});

  final List<Product> products = [
    Product(name: 'Product 1', description: 'Product 1', price: 19.99, image: 'assets/product1.jpg'),
    Product(name: 'Product 2', description: 'Product 2', price: 29.99, image: 'assets/product2.jpg'),
    Product(name: 'Product 3', description: 'Product 3', price: 39.99, image: 'assets/product3.jpg'),
    Product(name: 'Product 4', description: 'Product 4', price: 49.99, image: 'assets/product4.jpg'),
    Product(name: 'Product 5', description: 'Product 5', price: 59.99, image: 'assets/product5.jpg'),
  ];
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var columnCount = size.width > 600 ? 3 : 2;

    return Scaffold(
      body: GridView.count(
        crossAxisCount: columnCount,
        children: products.map((item) => _buildItem(item)).toList(),
      ),
    );
  }

  Widget _buildItem(Product item) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Center(child: Text(item.name)),
    );
  }
}
import 'package:flutter/material.dart';
import './product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products) {
    print('[products widget] constructor');
  }

  Widget _buildProductList() {
    Widget productcards;
    if (products.length > 0) {
      productcards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productcards = Container();
    }
    return productcards;
  }

  @override
  Widget build(BuildContext context) {
    print('[products widget] build');
    return _buildProductList();
  }
}

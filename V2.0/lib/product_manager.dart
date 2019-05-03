import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';

class ProductManager extends StatelessWidget{

  final List<Map<String,String>> products;
  final Function addProducts;
  final Function deleteProducts;

ProductManager(this.addProducts,this.deleteProducts,this.products);

@override
  Widget build(BuildContext context) {
    // print('[productManager state] build'); 
    return Column(
       children:[
          Container(
              margin: EdgeInsets.all(15.0),
              child:ProductControl(addProducts),
          ),
          Expanded(child:Products(products,deleteproduct :deleteProducts))
          ],);
          
  }



}





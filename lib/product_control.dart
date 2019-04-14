import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget{
 
    final Function addproduct;

    ProductControl(this.addproduct);


   @override
     Widget build(BuildContext context) {
       
       return RaisedButton(
                color: Theme.of(context).primaryColor,
              onPressed: (){
                addproduct({'title':'chochalate','image':'assets/sabra.jpg'});
              },
              child: Text('Add Product'),
            );
     }




}
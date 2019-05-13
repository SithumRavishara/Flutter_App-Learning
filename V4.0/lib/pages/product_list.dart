import 'package:flutter/material.dart';
import './product_edit.dart';

class ProductListPage extends StatelessWidget {
  final Function updateProduct;
  final Function deleteProduct;
  final List<Map<String, dynamic>> products;

  ProductListPage(this.products, this.updateProduct,this.deleteProduct);

  Widget _buildEditButton(BuildContext context,int index){
      return IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ProductEditPage(
                            product: products[index],
                            updateProduct: updateProduct,
                            productIndex: index,
                          );
                        },
                      ),
                    );
                  },
                );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        //dismissable use kre swipe krla list item delete krnna ,akata uniqkey akak denna ona
        return Dismissible( 
          key: Key(products[index]['title']),
          onDismissed: (DismissDirection direction){
            if (direction == DismissDirection.startToEnd) {
              deleteProduct(index);
            }else if(direction == DismissDirection.endToStart){
              print('Swiped end to start');
            }else{
              print('other swping');
            }
          },
          background: Container(color: Colors.red,),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  //meken thamai image aka circle wenne.
                  backgroundImage: AssetImage(products[index]['image']),
                ),
                title: Text(products[index]['title']),
                subtitle: Text('\$${products[index]['price'].toString()}'),
                trailing: _buildEditButton(context, index),
              ),
              Divider()
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
}

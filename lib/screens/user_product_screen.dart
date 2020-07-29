import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/screens/edit_product_screen.dart';

import './../app_drawer.dart';
import './../providers/products_provider.dart';
import './../widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = "/user-product-page";

  @override
  Widget build(BuildContext context) {
    var productsProvider = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Products"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditProductScreen.routeName, arguments: null);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, index) {
            var item = productsProvider.items[index];
            return Column(
              children: <Widget>[
                UserProductItem(
                  title: item.title,
                  imageUrl: item.imageUrl,
                  edit: () => Navigator.of(context).pushNamed(
                      EditProductScreen.routeName,
                      arguments: item.id),
                  delete: () {
                    showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Are You Sure?"),
                        content: Text(
                            "Are you sure you want to delete this product?"),
                        actions: <Widget>[
                          RaisedButton(
                            child: Text("Yes"),
                            onPressed: () => {Navigator.of(context).pop(true)},
                          ),
                          RaisedButton(
                            child: Text("No"),
                            onPressed: () => {Navigator.of(context).pop(false)},
                          ),
                        ],
                      ),
                    ).then((value) {
                      if (value) {
                        productsProvider.removeById(item.id);
                      }
                    });
                  },
                ),
                Divider(),
              ],
            );
          },
          itemCount: productsProvider.items.length,
        ),
      ),
    );
  }
}

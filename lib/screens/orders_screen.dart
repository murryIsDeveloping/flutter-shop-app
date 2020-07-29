import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_drawer.dart';
import './../widgets/order_item.dart';
import './../providers/orders_provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    var ordersProvider = Provider.of<OrdersProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
          itemCount: ordersProvider.items.length,
          itemBuilder: (ctx, i) => OrderItem(ordersProvider.items[i]),
        ));
  }
}

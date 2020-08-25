import 'package:flutter/material.dart';
import '../screens/user_products_screen.dart';
import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Shop App'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            title: Text('Shop'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            },
            title: Text('Orders'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routName);
            },
            title: Text('Manage Products'),
          )
        ],
      ),
    );
  }
}

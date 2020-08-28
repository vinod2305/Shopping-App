import 'package:flutter/material.dart';
import './providers/auth.dart';
import './screens/auth_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/user_products_screen.dart';
import './screens/orders_screen.dart';
import './providers/orders.dart';
import './screens/cart_screen.dart';
import './providers/cart.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (context, value, previous) =>
              Products(value.token,value.userId, previous == null ? [] : previous.items),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (context, value, previous) =>
              Orders(value.token, previous == null ? [] : previous.orders),
        ),
      ],
      child: Consumer<Auth>(
          builder: (context, value, child) => MaterialApp(
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: Colors.purple,
                    accentColor: Colors.deepOrange,
                    fontFamily: 'Lato',
                  ),
                  home: value.isAuth ? ProductsOverviewScreen() : AuthScreen(),
                  routes: {
                    ProductDetailScreen.routeName: (context) =>
                        ProductDetailScreen(),
                    CartScreen.routeName: (context) => CartScreen(),
                    OrdersScreen.routeName: (context) => OrdersScreen(),
                    UserProductsScreen.routName: (context) =>
                        UserProductsScreen(),
                    EditProductScreen.routeName: (context) =>
                        EditProductScreen(),
                  })),
    );
  }
}

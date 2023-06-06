
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nano_health_suite/screens/tabs/all_product_list_screen.dart';
import 'package:nano_health_suite/screens/tabs/cart_screen.dart';
import 'package:nano_health_suite/screens/tabs/favorite_screen.dart';
import 'package:nano_health_suite/screens/tabs/profile_screen.dart';

class TabNavigator extends StatelessWidget{
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;


  const TabNavigator({ Key? key, required this.navigatorKey, required this.tabItem}):super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? child;

    if(tabItem == "AllProductPage")
      child = AllProductListScreen();
    else if(tabItem == "CartPage")
      child = CartScreen();
    else if (tabItem == "FavoritePage")
      child = FavoriteScreen();
    else if (tabItem == "ProfilePage")
      child = ProfileScreen();

    return Navigator(
      key:  navigatorKey,
      onGenerateRoute: (routeSettings){
        return MaterialPageRoute(builder: (context)=> child!);
      },
    );
  }

}
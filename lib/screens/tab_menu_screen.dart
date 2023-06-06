import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nano_health_suite/tab_navigator.dart';

class TabMenuScreen extends StatefulWidget{
  @override
  State<TabMenuScreen> createState() => _TabMenuScreenState();
}

class _TabMenuScreenState extends State<TabMenuScreen> {

  int _currentIndex = 0;
  String _currentPage ='AllProductPage';
  List<String> pageKeys = ["AllProductPage","CartPage","FavoritePage","ProfilePage"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys ={
    "AllProductPage":GlobalKey<NavigatorState>(),
    "CartPage":GlobalKey<NavigatorState>(),
    "FavoritePage":GlobalKey<NavigatorState>(),
    "ProfilePage":GlobalKey<NavigatorState>(),
  };

  void _selectTab(String tabItem, int index){
    if(tabItem == _currentPage){
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    }
    else{
      setState(() {
        _currentPage = pageKeys[index];
        _currentIndex = index;
      });
    }

  }

  Widget _buildOffstageNavigator(String tabItem){
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        final isFirstRouteInCurrentTab =
        ! await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab){
          if(_currentPage != "Page1"){
            _selectTab("Page1", 1);

            return false;

          }
        }

        /// let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        // extendBody: true,

        body: Stack(
          children: [
            _buildOffstageNavigator("AllProductPage"),
            _buildOffstageNavigator("CartPage"),
            _buildOffstageNavigator("FavoritePage"),
            _buildOffstageNavigator("ProfilePage"),
          ],
        ),

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
          ),
          child: BottomNavigationBar (

            elevation: 0,
            backgroundColor: Colors.transparent,
            type:BottomNavigationBarType.fixed ,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _currentIndex,
            onTap: (index) {
              _selectTab(pageKeys[index], index);
            },
            items:  [
              BottomNavigationBarItem(
                activeIcon: ImageIcon(AssetImage("assets/images/home_icon.png"),color: Color(0xff2ab3c6),),
                icon: ImageIcon(AssetImage("assets/images/home_icon.png"),color: Colors.grey.shade400),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: ImageIcon(AssetImage("assets/images/cart_icon.png"),color: Color(0xff2ab3c6),),
                icon: ImageIcon(AssetImage("assets/images/cart_icon.png"),color: Colors.grey.shade400),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: ImageIcon(AssetImage("assets/images/like_icon.png"),color: Color(0xff2ab3c6),),
                icon: ImageIcon(AssetImage("assets/images/like_icon.png"),color: Colors.grey.shade400),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: ImageIcon(AssetImage("assets/images/vector_icon.png"),color: Color(0xff2ab3c6),),
                icon: ImageIcon(AssetImage("assets/images/vector_icon.png"),color: Colors.grey.shade400),
                label: 'Home',


              ),
            ],
          ),
        ),

      ),
    );
  }
}
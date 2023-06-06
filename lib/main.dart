

import 'package:flutter/material.dart';
import 'package:nano_health_suite/providers/auth_provider.dart';
import 'package:nano_health_suite/providers/product_provider.dart';
import 'package:nano_health_suite/screens/login_screen.dart';
import 'package:nano_health_suite/screens/tab_menu_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/keys.dart';
Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();


  SharedPreferences prefs = await SharedPreferences.getInstance();
  String loggedIn = prefs.getString(Keys.savedLoggedInUserKey)?? "{}";
  bool showHome = false;
  if (loggedIn != "{}"&& loggedIn != null )
  {showHome = true;}
  else{
    showHome =false;
  }
  runApp( MyApp(showHome: showHome,));
}

class MyApp extends StatelessWidget {
  bool showHome;

  MyApp( {Key? key,required this.showHome,}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return



      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home:
            showHome?
          TabMenuScreen()
              :LoginScreen()




        //TabMenuScreen(),
      ),
    );
  }
}



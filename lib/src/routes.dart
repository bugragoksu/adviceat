

import 'package:adviceat/src/view/pages/food_page.dart';
import 'package:adviceat/src/view/pages/login_page.dart';
import 'package:adviceat/src/view/pages/malzeme_list.dart';
import 'package:flutter/material.dart' show runApp, MaterialApp, WidgetBuilder;

class Routes {
  final routes = <String, WidgetBuilder>{
    "/": (context) => LoginPage(),
    "/home": (context) => HomePage(),
    "/malzeme": (context) => MalzemeListesi(),
    
  
    
    
  };

  Routes() {
    
    runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: routes,
    ));
  }
}

import 'package:flutter/material.dart';

import 'package:validacion_form/src/blocs/provider2.dart';
import 'package:validacion_form/src/pages/home_page.dart';

import 'package:validacion_form/src/pages/login_page.dart';
import 'package:validacion_form/src/pages/producto_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Provider(
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login'   : ( BuildContext context ) => LoginPage(),
          'home'    : ( BuildContext context ) => HomePage(),
          'producto': ( BuildContext context ) => ProductoPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
      )
    );
    
  }
}
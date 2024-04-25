import 'package:flutter/material.dart';
import 'package:proyecto_2do_parcial/src/screens/LoginScreen.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
    
  }
}
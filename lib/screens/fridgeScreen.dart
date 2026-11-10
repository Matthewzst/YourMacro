import 'package:flutter/material.dart';
import 'package:your_macro/decoration.dart';
import 'package:your_macro/navigationBar.dart';

class FridgeScreen extends StatelessWidget{
  const FridgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fridge'),
        backgroundColor: primeColor,
      ),
      body: Center(
        child: Text('This is the Fridge Screen'),
      ),
      bottomNavigationBar: NavigationBarbottom(),
    );

  }

}
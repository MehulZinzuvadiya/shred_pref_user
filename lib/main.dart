import 'package:flutter/material.dart';
import 'package:shred_pref_user/View/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => HomeScreen(),
    },
  ));
}

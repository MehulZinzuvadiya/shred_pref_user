import 'package:flutter/material.dart';
import 'package:shred_pref_user/View/home_screen.dart';
import 'package:shred_pref_user/View/sub_register_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // theme: ThemeData(useMaterial3: false),
    routes: {
      '/': (context) => HomeScreen(),
      'sublist': (context) => SubRegisterPage(),
    },
  ));
}

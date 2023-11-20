import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shred_pref_user/Controller/home_controller.dart';
import 'package:shred_pref_user/View/register_screen.dart';
import 'package:shred_pref_user/View/user_detail.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeController.homecontroller.tabController =
        TabController(vsync: this, length: 3);
    HomeController.homecontroller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text(
            " SharedPref User Integration",
            style: GoogleFonts.poppins(),
          ),
          bottom: TabBar(
              controller: HomeController.homecontroller.tabController,
              labelPadding: EdgeInsets.all(10),
              tabs: const [
                Icon(Icons.verified_user),
                Icon(Icons.person),
                Icon(Icons.group),
              ]),
        ),
        body: TabBarView(
          controller: HomeController.homecontroller.tabController,
          children: const [
            LoginScreen(),
            RegisterScreen(),
            UserDetail(),
          ],
        ),
      )),
    );
  }
}

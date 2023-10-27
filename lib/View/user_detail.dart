import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/home_controller.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(Icons.sync),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(18),
          ),
          child: ListView.builder(
            itemCount: HomeController.homecontroller.userList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name:",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    Text(
                                      "Email:",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    Text(
                                      "DOB:",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    Text(
                                      "Password:",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${HomeController.homecontroller.userList[index]['name']}",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    Text(
                                      "${HomeController.homecontroller.userList[index]['email']}",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    Text(
                                      "${HomeController.homecontroller.userList[index]['Dob']}",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    Text(
                                      "${HomeController.homecontroller.userList[index]['password']}",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                HomeController.homecontroller.index = index;
                                HomeController.homecontroller.isUpdate = true;

                                HomeController.homecontroller.txtup_name =
                                    TextEditingController(
                                  text: HomeController
                                      .homecontroller.userList[index]['name'],
                                );

                                HomeController.homecontroller.txtup_email =
                                    TextEditingController(
                                        text: HomeController.homecontroller
                                            .userList[index]['email']);

                                HomeController
                                        .homecontroller.txtup_confirmPass =
                                    TextEditingController(
                                        text: HomeController.homecontroller
                                            .userList[index]['password']);

                                HomeController.homecontroller.txtup_password =
                                    TextEditingController(
                                  text: HomeController.homecontroller
                                      .userList[index]['password'],
                                );
                                HomeController.homecontroller.tabController
                                    .animateTo(1);
                              });
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                HomeController.homecontroller.deleteData(index);
                              });
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    )),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}

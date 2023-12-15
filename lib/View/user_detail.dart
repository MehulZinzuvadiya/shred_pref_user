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
        child: const Icon(Icons.sync),
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
                                      "Age:",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    Text(
                                      "Password:",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                content: HomeController.homecontroller
                                                            .userList[index]["innerList"] !=
                                                        null
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: HomeController.homecontroller
                                                            .userList[index]["innerList"].length,
                                                        itemBuilder: (context, subindex) {
                                                          print("$subindex");
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets.only(bottom: 5),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 6,
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                      color: Colors.blue.shade200,
                                                                      borderRadius:
                                                                          BorderRadius.circular(10),
                                                                    ),
                                                                    child: Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(10),
                                                                      child: SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child: Row(
                                                                          children: [
                                                                            Column(
                                                                              crossAxisAlignment:
                                                                                  CrossAxisAlignment
                                                                                      .start,
                                                                              children: [
                                                                                Text(
                                                                                  "Name:",
                                                                                  style: GoogleFonts
                                                                                      .poppins(
                                                                                          fontSize:
                                                                                              14),
                                                                                ),
                                                                                Text(
                                                                                  "Email:",
                                                                                  style: GoogleFonts
                                                                                      .poppins(
                                                                                          fontSize:
                                                                                              14),
                                                                                ),
                                                                                Text(
                                                                                  "DOB:",
                                                                                  style: GoogleFonts
                                                                                      .poppins(
                                                                                          fontSize:
                                                                                              14),
                                                                                ),
                                                                                Text(
                                                                                  "Password:",
                                                                                  style: GoogleFonts
                                                                                      .poppins(
                                                                                          fontSize:
                                                                                              14),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 30,
                                                                            ),
                                                                            Column(
                                                                              crossAxisAlignment:
                                                                                  CrossAxisAlignment
                                                                                      .start,
                                                                              children: [
                                                                                Text(
                                                                                  "${HomeController.homecontroller.userList[index]["innerList"][subindex]['name']}",
                                                                                  style: GoogleFonts
                                                                                      .poppins(
                                                                                          fontSize:
                                                                                              14),
                                                                                ),
                                                                                Text(
                                                                                  "${HomeController.homecontroller.userList[index]["innerList"][subindex]['email']}",
                                                                                  style: GoogleFonts
                                                                                      .poppins(
                                                                                          fontSize:
                                                                                              14),
                                                                                ),
                                                                                Text(
                                                                                  "${HomeController.homecontroller.userList[index]["innerList"][subindex]['Dob']}",
                                                                                  style: GoogleFonts
                                                                                      .poppins(
                                                                                          fontSize:
                                                                                              14),
                                                                                ),
                                                                                Text(
                                                                                  "${HomeController.homecontroller.userList[index]["innerList"][subindex]['password']}",
                                                                                  style: GoogleFonts
                                                                                      .poppins(
                                                                                          fontSize:
                                                                                              14),
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
                                                                            HomeController
                                                                                .homecontroller
                                                                                .index = index;

                                                                            HomeController
                                                                                    .homecontroller
                                                                                    .updateIndex =
                                                                                subindex;

                                                                            HomeController
                                                                                .homecontroller
                                                                                .isSubUpdate = true;

                                                                            HomeController
                                                                                    .homecontroller
                                                                                    .txtup_name =
                                                                                TextEditingController(
                                                                              text: HomeController
                                                                                          .homecontroller
                                                                                          .userList[
                                                                                      index]['innerList']
                                                                                  [
                                                                                  subindex]['name'],
                                                                            );

                                                                            HomeController
                                                                                    .homecontroller
                                                                                    .txtup_email =
                                                                                TextEditingController(
                                                                                    text: HomeController
                                                                                                .homecontroller
                                                                                                .userList[index]
                                                                                            [
                                                                                            'innerList']
                                                                                        [
                                                                                        subindex]['email']);

                                                                            HomeController
                                                                                    .homecontroller
                                                                                    .txtup_name =
                                                                                TextEditingController(
                                                                              text: HomeController
                                                                                          .homecontroller
                                                                                          .userList[
                                                                                      index]['innerList']
                                                                                  [
                                                                                  subindex]['name'],
                                                                            );

                                                                            HomeController
                                                                                    .homecontroller
                                                                                    .txtup_confirmPass =
                                                                                TextEditingController(
                                                                                    text: HomeController
                                                                                                .homecontroller
                                                                                                .userList[index]['innerList']
                                                                                            [
                                                                                            subindex]
                                                                                        [
                                                                                        'password']);

                                                                            HomeController
                                                                                    .homecontroller
                                                                                    .txtup_password =
                                                                                TextEditingController(
                                                                              text: HomeController
                                                                                          .homecontroller
                                                                                          .userList[
                                                                                      index]['innerList']
                                                                                  [
                                                                                  subindex]['password'],
                                                                            );
                                                                            Navigator.of(context)
                                                                                .pushNamed(
                                                                                    'sublist');
                                                                          });
                                                                        },
                                                                        icon:
                                                                            const Icon(Icons.edit)),
                                                                    IconButton(
                                                                        onPressed: () {
                                                                          showDialog(
                                                                            builder: (context) =>
                                                                                AlertDialog(
                                                                              title: const Text(
                                                                                  'Are you sure?'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () =>
                                                                                      Navigator.pop(
                                                                                          context),
                                                                                  // Closes the dialog
                                                                                  child: const Text(
                                                                                      'No'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () {
                                                                                    HomeController
                                                                                        .homecontroller
                                                                                        .deleteSubData(
                                                                                            index:
                                                                                                index,
                                                                                            subindex:
                                                                                                subindex);
                                                                                    Navigator.pop(
                                                                                        context);
                                                                                    Navigator.pop(
                                                                                        context);
                                                                                  },
                                                                                  child: const Text(
                                                                                      'Yes'),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            context: context,
                                                                          );
                                                                        },
                                                                        icon: const Icon(
                                                                            Icons.delete)),
                                                                  ],
                                                                )),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      )
                                                    : const Text(
                                                        "UserData Is Not Found",
                                                      ),
                                              );
                                            });
                                      },
                                      child: Text(
                                        "Count:",
                                        style: GoogleFonts.poppins(
                                            fontSize: 18, color: Colors.blue.shade400),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
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
                                      "${HomeController.homecontroller.userList[index]['age']}",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    Text(
                                      "${HomeController.homecontroller.userList[index]['password']}",
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    Text(
                                      HomeController.homecontroller.userList[index]['innerList'] == null
                                          ? "${HomeController.homecontroller.count}"
                                          : "${HomeController.homecontroller.userList[index]['innerList'].length}",
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

                                HomeController.homecontroller.txtup_name = TextEditingController(
                                  text: HomeController.homecontroller.userList[index]['name'],
                                );

                                HomeController.homecontroller.txtup_email = TextEditingController(
                                    text: HomeController.homecontroller.userList[index]['email']);

                                HomeController.homecontroller.txtup_confirmPass =
                                    TextEditingController(
                                        text: HomeController.homecontroller.userList[index]
                                            ['password']);

                                HomeController.homecontroller.selectedDate = DateTime.parse(
                                    "${HomeController.homecontroller.userList[index]['date']}");

                                HomeController.homecontroller.txtup_password =
                                    TextEditingController(
                                  text: HomeController.homecontroller.userList[index]['password'],
                                );

                                HomeController.homecontroller.tabController.animateTo(1);
                              });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                HomeController.homecontroller.deleteData(index);
                              });
                            },
                            icon: const Icon(Icons.delete)),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('sublist');
                            HomeController.homecontroller.userIndex = HomeController
                                .homecontroller.userList
                                .indexOf(HomeController.homecontroller.userList[index]);
                          },
                          icon: const Icon(Icons.add),
                        ),
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

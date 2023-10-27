import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/home_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> updateformkey = GlobalKey<FormState>();

  List userList = [];

  int selectedIndex = 0;

  bool passwordVisible = false;
  bool passwordVisible1 = false;

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
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade200),
                  child: Form(
                    key: HomeController.homecontroller.isUpdate
                        ? updateformkey
                        : formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: HomeController.homecontroller.isUpdate
                                ? HomeController.homecontroller.txtup_name
                                : HomeController.homecontroller.txt_name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Name';
                              }
                            },
                            decoration: const InputDecoration(
                                hintText: 'Enter Your Name'),
                          ),
                          TextFormField(
                            controller: HomeController.homecontroller.isUpdate
                                ? HomeController.homecontroller.txtup_email
                                : HomeController.homecontroller.txt_email,
                            validator:
                                ValidationBuilder().required().email().build(),
                            decoration: const InputDecoration(
                                hintText: 'Enter Your Email'),
                          ),
                          DateTimeFormField(
                            validator: (value) {
                              if (value == null) {
                                return 'Please Select date';
                              } else if (HomeController.homecontroller.isAdult(
                                      HomeController
                                          .homecontroller.selectedDate) !=
                                  true) {
                                return "Age must be 18";
                              }
                            },

                            // initialValue:  HomeController.homecontroller.selectedDate,
                            onDateSelected: (value) {
                              HomeController.homecontroller.selectedDate =
                                  value;
                            },
                            mode: DateTimeFieldPickerMode.date,
                            decoration: const InputDecoration(
                              hintText: 'Date Of Birth',
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: HomeController.homecontroller.isUpdate
                                ? HomeController.homecontroller.txtup_password
                                : HomeController.homecontroller.txt_password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Password';
                              }
                            },
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                hintText: 'Enter Password'),
                          ),
                          TextFormField(
                            controller: HomeController.homecontroller.isUpdate
                                ? HomeController
                                    .homecontroller.txtup_confirmPass
                                : HomeController.homecontroller.txt_confirmPass,
                            validator: (value) {
                              if (HomeController.homecontroller.isUpdate ==
                                  true) {
                                if (value !=
                                    HomeController
                                        .homecontroller.txtup_password.text) {
                                  return 'Enter Same Password';
                                }
                              } else {
                                if (value !=
                                    HomeController
                                        .homecontroller.txt_password.text) {
                                  return 'Enter Same Password';
                                }
                              }
                            },
                            obscureText: passwordVisible1,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(passwordVisible1
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible1 = !passwordVisible1;
                                    });
                                  },
                                ),
                                hintText: 'Enter Confirm Password'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                              // style: ButtonStyle(
                              //     shape: MaterialStateProperty.all(
                              //         RoundedRectangleBorder(
                              //             borderRadius:
                              //                 BorderRadius.circular(15)))),
                              onPressed: () {
                                if (HomeController.homecontroller.isUpdate ==
                                    true) {
                                  if (updateformkey.currentState!.validate()) {
                                    HomeController.homecontroller.tabController
                                        .animateTo(2);
                                    setState(() {
                                      HomeController.homecontroller.updateUser(
                                          HomeController.homecontroller.index);
                                    });
                                    HomeController.homecontroller.isUpdate =
                                        false;
                                  }
                                } else {
                                  if (formkey.currentState!.validate()) {
                                    HomeController.homecontroller.tabController
                                        .animateTo(2);
                                    setState(() {
                                      HomeController.homecontroller.addUser();
                                    });
                                    HomeController.homecontroller.txt_name
                                        .clear();
                                    HomeController.homecontroller.txt_email
                                        .clear();
                                    HomeController.homecontroller.txt_password
                                        .clear();
                                    HomeController
                                        .homecontroller.txt_confirmPass
                                        .clear();
                                  }
                                }
                              },
                              child: HomeController.homecontroller.isUpdate
                                  ? Text(
                                      "Update",
                                      style: GoogleFonts.poppins(),
                                    )
                                  : Text(
                                      "Register",
                                      style: GoogleFonts.poppins(),
                                    )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

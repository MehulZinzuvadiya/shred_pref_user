import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Controller/home_controller.dart';

class SubRegisterPage extends StatefulWidget {
  const SubRegisterPage({super.key});

  @override
  State<SubRegisterPage> createState() => _SubRegisterPageState();
}

class _SubRegisterPageState extends State<SubRegisterPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> updateformkey = GlobalKey<FormState>();

  List userList = [];

  int selectedIndex = 0;

  bool passwordVisible = false;
  bool passwordVisible1 = false;

  TextStyle poppins = GoogleFonts.poppins();

  Future selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: new DateTime(1920),
        lastDate: new DateTime(2030));
    if (picked != null)
      setState(() => {
            HomeController.homecontroller.selectedDate = picked,
            HomeController.homecontroller.intialdateval.text =
                DateFormat('d/M/yyyy').format(HomeController.homecontroller.selectedDate),
          });
  }

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
                      borderRadius: BorderRadius.circular(20), color: Colors.blue.shade200),
                  child: Form(
                    key: HomeController.homecontroller.isSubUpdate ? updateformkey : formkey,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: HomeController.homecontroller.isSubUpdate
                                ? HomeController.homecontroller.txtup_name
                                : HomeController.homecontroller.txt_name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Name';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Your Name',
                              hintStyle: GoogleFonts.poppins(),
                            ),
                          ),
                          TextFormField(
                            controller: HomeController.homecontroller.isSubUpdate
                                ? HomeController.homecontroller.txtup_email
                                : HomeController.homecontroller.txt_email,
                            validator: ValidationBuilder().required().email().build(),
                            decoration: InputDecoration(
                              hintText: 'Enter Your Email',
                              hintStyle: GoogleFonts.poppins(),
                            ),
                          ),
                          DateTimeFormField(
                            initialValue: HomeController.homecontroller.isSubUpdate
                                ? HomeController.homecontroller.selectedDate
                                : null,
                            validator: (value) {
                              if (value == null) {
                                return 'Please Select date';
                              } else if (HomeController.homecontroller
                                      .isAdult(HomeController.homecontroller.selectedDate) !=
                                  true) {
                                return "Age must be 18";
                              }
                            },
                            onDateSelected: (value) {
                              HomeController.homecontroller.selectedDate = value;

                              HomeController.homecontroller.age = HomeController.homecontroller
                                  .calculateAge(HomeController.homecontroller.selectedDate);
                            },
                            mode: DateTimeFieldPickerMode.date,
                            decoration: InputDecoration(
                              hintText: 'Date Of Birth',
                              hintStyle: GoogleFonts.poppins(),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: HomeController.homecontroller.isSubUpdate
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
                                icon:
                                    Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                              hintText: 'Enter Password',
                              hintStyle: poppins,
                            ),
                          ),
                          TextFormField(
                            controller: HomeController.homecontroller.isSubUpdate
                                ? HomeController.homecontroller.txtup_confirmPass
                                : HomeController.homecontroller.txt_confirmPass,
                            validator: (value) {
                              if (HomeController.homecontroller.isSubUpdate == true) {
                                if (value != HomeController.homecontroller.txtup_password.text) {
                                  return 'Enter Same Password';
                                }
                              } else {
                                if (value != HomeController.homecontroller.txt_password.text) {
                                  return 'Enter Same Password';
                                }
                              }
                            },
                            obscureText: passwordVisible1,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                    passwordVisible1 ? Icons.visibility : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible1 = !passwordVisible1;
                                  });
                                },
                              ),
                              hintText: 'Enter Confirm Password',
                              hintStyle: poppins,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                              onPressed: () {
                                if (HomeController.homecontroller.isSubUpdate == true) {
                                  if (updateformkey.currentState!.validate()) {
                                    setState(() {
                                      HomeController.homecontroller.age = HomeController
                                          .homecontroller
                                          .calculateAge(HomeController.homecontroller.selectedDate);
                                      HomeController.homecontroller.updateSubUser(
                                          HomeController.homecontroller.userIndex,
                                          HomeController.homecontroller.updateIndex);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("User Updated !!"),
                                      backgroundColor: Colors.green.shade200,
                                    ));
                                    HomeController.homecontroller.isSubUpdate = false;
                                    HomeController.homecontroller.txtup_name.clear();
                                    HomeController.homecontroller.txtup_email.clear();
                                    HomeController.homecontroller.txtup_password.clear();
                                    HomeController.homecontroller.txtup_confirmPass.clear();
                                  }
                                } else {
                                  if (formkey.currentState!.validate()) {
                                    Navigator.pop(context);
                                    setState(() {
                                      HomeController.homecontroller.age = HomeController
                                          .homecontroller
                                          .calculateAge(HomeController.homecontroller.selectedDate);
                                      HomeController.homecontroller.addSubUser();
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("User Added !!"),
                                      backgroundColor: Colors.green.shade200,
                                    ));
                                    HomeController.homecontroller.txt_name.clear();
                                    HomeController.homecontroller.txt_email.clear();
                                    HomeController.homecontroller.txt_password.clear();
                                    HomeController.homecontroller.txt_confirmPass.clear();
                                  }
                                }
                                HomeController.homecontroller.sort();
                              },
                              child: HomeController.homecontroller.isSubUpdate
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

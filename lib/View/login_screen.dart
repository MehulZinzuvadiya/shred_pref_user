import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shred_pref_user/Controller/home_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.shade200),
                child: Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller:
                                HomeController.homecontroller.txtlogin_email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Email';
                              }
                            },
                            decoration:
                                InputDecoration(hintText: 'Enter Your Email'),
                          ),
                          TextFormField(
                            controller:
                                HomeController.homecontroller.txtlogin_password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Password';
                              }
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye),
                                hintText: 'Enter Your Password'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  bool isUserValid = false;

                                  for (Map user in HomeController
                                      .homecontroller.userList) {
                                    if (user["email"] ==
                                            HomeController.homecontroller
                                                .txtlogin_email.text &&
                                        user["password"] ==
                                            HomeController.homecontroller
                                                .txtlogin_password.text) {
                                      isUserValid = true;
                                      break;
                                    }
                                  }
                                  String? username =
                                      HomeController.homecontroller.getUser(
                                          HomeController.homecontroller
                                              .txtlogin_email.text,
                                          HomeController.homecontroller
                                              .txtlogin_password.text);

                                  if (isUserValid) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          title: Text("Welcome Back !!"),
                                          content: Text(
                                              "${HomeController.homecontroller.username}"),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  HomeController.homecontroller
                                                      .txtlogin_email
                                                      .clear();
                                                  HomeController.homecontroller
                                                      .txtlogin_password
                                                      .clear();
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'OK',
                                                  style: GoogleFonts.poppins(),
                                                )),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content:
                                          Text('Invalid email or password'),
                                    ));
                                  }

                                  print(username);
                                }
                              },
                              child: Text(
                                "Login",
                                style: GoogleFonts.poppins(),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

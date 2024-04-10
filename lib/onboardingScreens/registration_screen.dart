import 'package:flutter/material.dart';
import 'package:kilele_health/gen/assets.gen.dart';
import 'package:kilele_health/views/dashboard.dart';

import '../constants.dart';
import '../firebase_auth/register_user.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _validateName = false;
  bool _validateEmail = false;
  bool _validatePassword = false;
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 8.0,),
              Assets.loginIllustration.image(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "REGISTER",
                  style: loginText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                          )
                        ]),
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          errorText: _validateName? "Field cannot be empty": null,
                            hintText: "Full Names", border: InputBorder.none),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0,top: 8.0, right: 32.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                          )
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            errorText: _validateEmail? "Field cannot be empty": null,
                            hintText: "Email", border: InputBorder.none),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 32.0, right: 32.0, top: 8.0, bottom: 8.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                          )
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            errorText: _validatePassword? "Field cannot be empty": null,
                            hintText: "Password", border: InputBorder.none),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 32.0, right: 32.0, bottom: 8.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            errorText: passwordController.text == confirmPasswordController.text ? null : "Passwords do not match",
                            hintText: "Confirm Password", border: InputBorder.none),
                      ),
                    )),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    if(nameController.text.isEmpty && emailController.text.isEmpty && passwordController.text == confirmPasswordController.text){
                      _validateName = true;
                      _validateEmail = true;
                      _validatePassword = true;
                    } else{
                      _validateName = false;
                      _validateEmail = false;
                      _validatePassword = false;
                      FireAuth.registerUsingEmailPassword(name: nameController.text, email: emailController.text, password: passwordController.text, context: context);
                    }
                  });


                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => DashboardScreen()));
                },
                color: KileleBrown,
                elevation: 8.0,
                child: Text(
                  "REGISTER",
                  style: welcomeText,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    "Have an account? Sign In",
                    style: textButtonStyle,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}


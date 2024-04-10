import 'package:flutter/material.dart';
import 'package:kilele_health/gen/assets.gen.dart';
import 'package:kilele_health/onboardingScreens/registration_screen.dart';
import 'package:kilele_health/views/dashboard.dart';

import '../constants.dart';
import '../firebase_auth/register_user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  bool _validateEmail = false;
  bool _validatePassword = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.loginIllustration.image(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "LOGIN",
                    style: loginText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
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
                          controller: emailController,
                          decoration: InputDecoration(
                              errorText: _validateEmail? "Field cannot be empty": null,
                              hintText: "Email", border: InputBorder.none),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 8.0, bottom: 8.0),
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
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      if(emailController.text.isEmpty && passwordController.text.isEmpty){
                        _validateEmail = true;
                        _validatePassword = true;
                      } else{
                        _validateEmail = false;
                        _validatePassword = false;
                        FireAuth.logInUser(emailController.text, passwordController.text, context);
                      }
                    });
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) => DashboardScreen()));
                  },
                  color: KileleBrown,
                  elevation: 8.0,
                  child: Text(
                    "LOGIN",
                    style: welcomeText,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => RegistrationScreen()));
                    },
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: textButtonStyle,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

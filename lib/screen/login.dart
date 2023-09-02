import 'package:ecommerceapp/components/custom_button.dart';
import 'package:ecommerceapp/components/custom_textInput.dart';
import 'package:ecommerceapp/utils/login_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _LoadingButton = false;

  Map<String, String> data = {};

  _LoginScreenState() {
    data = LoginData.SignIn;
  }

  void switchLogin() {
    setState(() {
      if (mapEquals(data, LoginData.SignUp)) {
        data = LoginData.SignIn;
      } else {
        data = LoginData.SignUp;
      }
    });
  }

  void LoginButtonPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 45, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      data['heading'] as String,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Text(
                    data['Sub heading'] as String,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            model(data, _emailController, _passwordController),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: TextButton(
                      onPressed: switchLogin,
                      child: Text(
                        data['footer'] as String,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  model(Map<String, String> data, TextEditingController emailController,
      TextEditingController passwordController) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 56),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(1, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          CustomTextInput(
            label: "Your Email address",
            placeholder: "emial@adress.com",
            icon: Icons.person_2_outlined,
            textEditingController: _emailController,
          ),
          CustomTextInput(
            label: "Password",
            placeholder: "Password",
            icon: Icons.key,
            password: true,
            textEditingController: _passwordController,
          ),
          CustomButton(
              text: data["label"] as String,
              onPress: LoginButtonPressed,
              loading: _LoadingButton),
        ],
      ),
    );
  }
}

import 'package:ecommerceapp/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/application_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _loadingButton = false;

  SignOutButtonPress() {
    setState(() {
      _loadingButton = true;
    });
    Provider.of<ApplicationState>(context, listen: false).signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "Hello There",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          CustomButton(
            text: "SIGN OUT",
            onPress: SignOutButtonPress,
            loading: _loadingButton,
          )
        ],
      ),
    );
  }
}

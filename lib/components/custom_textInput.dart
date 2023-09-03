import 'package:ecommerceapp/utils/costum_theme.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final IconData icon;
  final TextEditingController textEditingController;
  final bool password;
  CustomTextInput(
      {super.key,
      required this.label,
      required this.placeholder,
      required this.icon,
      this.password = false,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              label,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(
            height: 56,
            child: TextField(
              controller: textEditingController,
              obscureText: true,
              enableSuggestions: password,
              autocorrect: !password,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(start: 22, end: 20),
                  child: Icon(
                    icon,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                filled: true,
                hintStyle: TextStyle(color: CustomTheme.grey),
                hintText: placeholder,
                fillColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

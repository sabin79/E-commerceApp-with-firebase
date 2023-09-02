import 'package:ecommerceapp/utils/costum_theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPress;
  final bool loading;

  CustomButton(
      {super.key,
      required this.text,
      required this.onPress,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: CostumeTheme.yellow,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
            spreadRadius: 4,
            offset: Offset(1, 3),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: loading ? null : onPress,
        child: loading
            ? Text("Loading")
            : Text(
                text,
                style: Theme.of(context).textTheme.titleSmall,
              ),
      ),
    );
  }
}

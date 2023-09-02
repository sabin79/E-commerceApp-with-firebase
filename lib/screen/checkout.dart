import 'package:ecommerceapp/components/custom_button.dart';
import 'package:ecommerceapp/components/list_card.dart';
import 'package:ecommerceapp/utils/costum_theme.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final carts = ["1", "2"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 30),
            itemCount: carts.length,
            itemBuilder: (context, index) {
              return ListCard();
            },
          ),
          priceFooter(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: CustomButton(
              text: "CHECKOUT",
              onPress: () {},
              loading: false,
            ),
          )
        ],
      ),
    );
  }

  priceFooter() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            height: 2,
            color: CustomTheme.grey,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Text(
                  "Total",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Spacer(),
                Text(
                  "\$ price",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

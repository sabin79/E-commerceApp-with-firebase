import 'package:ecommerceapp/components/grid_card.dart';
import 'package:ecommerceapp/screen/product.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final data = ['1', '2'];
  @override
  Widget build(BuildContext context) {
    onCardPress() {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => ProductScreen())));
    }

    return Container(
        child: GridView.builder(
            itemCount: data.length,
            padding: EdgeInsets.symmetric(vertical: 30),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GridCard(index: index, onPress: onCardPress);
            }));
  }
}

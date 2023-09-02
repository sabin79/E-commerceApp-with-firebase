import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final int index;
  final void Function() onPress;
  GridCard({super.key, required this.index, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index % 2 == 0
          ? const EdgeInsets.only(left: 22)
          : const EdgeInsets.only(right: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 6,
              spreadRadius: 4,
              offset: Offset(0, 2))
        ],
      ),
      child: GestureDetector(
        onTap: onPress,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: SizedBox(
                  width: double.infinity,
                  child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          "https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80"),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            "Name",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Text(
                          "Price",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

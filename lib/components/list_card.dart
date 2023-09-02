import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 3,
              spreadRadius: 4,
              offset: Offset(1, 3))
        ],
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Row(children: [
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://images.unsplash.com/photo-1554735490-5974588cbc4f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          "title",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Qty = 1",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          "\$ Price",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}

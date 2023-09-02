import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/components/custom_button.dart';
import 'package:ecommerceapp/utils/costum_theme.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool addButtonLoad = false;

  void onAddToCart() async {
    setState(() {
      addButtonLoad = true;
    });
    // add to cart
    setState(() {
      addButtonLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
              top: 35,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      offset: Offset(1, 3),
                    ),
                  ],
                ),
                child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
              )),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80"),
                    ),
                    Positioned(
                      top: 35,
                      right: 35,
                      child: Container(
                        decoration: ShapeDecoration(
                          color: CustomTheme.yellow,
                          shape: CircleBorder(),
                          shadows: [
                            BoxShadow(
                                color: CustomTheme.grey,
                                blurRadius: 3,
                                offset: Offset(0, 2))
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.share),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.headlineLarge!,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 22),
                          child: Text(
                            "title",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            children: [
                              Text("MRP: "),
                              Text("\$ price"),
                            ],
                          ),
                        ),
                        CustomButton(
                            text: "Add to Cart",
                            onPress: onAddToCart,
                            loading: addButtonLoad),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "About the Items",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: Text(
                            "The Items Discription",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';

class CustomCollection extends StatelessWidget {
  final String name;
  final String price;
  final String discount;
  final String discountPrice;
  final String image;
  final String description;

  const CustomCollection({
    required this.name,
    required this.price,
    required this.description,
    required this.discount,
    required this.discountPrice,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(discount),
         Image.network(image),
         Text(description),
         Text(name),
         Text(price),
         Text(discountPrice),
      ],
    );
  }
}

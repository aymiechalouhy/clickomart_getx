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
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Row( mainAxisAlignment: MainAxisAlignment.end,
                   children: const[
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Icon(Icons.favorite, color: Colors.blue,
                        size: 35),
                      ),
                   ],
                 ),
                 Row(
                   children: [
                     Flexible(
                       child: Text(
                            name,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 3,
                          ),
                     ),
                   ],
                 ),         
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 7, bottom: 7),
                  child: Text(description),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(image),
            ),
          ],
        ),
        Center(
            child: Text(
          "LBP $price",
          style: const TextStyle(
            fontSize: 15,
          ),
        )),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 40,
            width: 180,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Add To Cart',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
         TextButton(
              onPressed: () {},
              child: const Text(
                'Done',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
            ),
      ],
    );
  }
}

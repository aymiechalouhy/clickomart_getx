import 'package:flutter/material.dart';

class CustomItems extends StatelessWidget {
  final String name;
  final String price;
  final String discount;
  final String discountPrice;
  final String image;
  final String description;
  // final VoidCallback onClicked;

  const CustomItems({
    required this.price,
    required this.description,
    required this.discount,
    required this.discountPrice,
    required this.image,
    required this.name,
    // required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 155,
          width: 120,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 55),
                    child: IconButton(
                      icon: (const Icon(
                              Icons.favorite,
                              size: 25,
                              color:Color.fromARGB(129, 199, 186, 199),
                            )
                          ),
                      onPressed: () {
                
                      },
                    ),
                  ),
                ],
              ),
              Image.network("${image
                          .replaceAll(
                              RegExp(
                                  r'clickomart-s3-eu-central-1\.amazonaws\.com'),
                              'clickomart.imgix.net')
                          .replaceAll(
                              RegExp(
                                  r'clickomart\.s3\.eu-central-1\.amazonaws\.com'),
                              'clickomart.imgix.net')
                          .replaceAll(
                              RegExp(
                                  r'clickomart\.s3-eu-central-1\.amazonaws\.com'),
                              'clickomart.imgix.net')
                          .replaceAll(
                              RegExp(
                                  r's3\.eu-central-1\.amazonaws\.com\/clickomart'),
                              'clickomart.imgix.net')}?w=200&auto=enhance,format",
                  height: 80,
                  width: 80, errorBuilder: (ctx, o, n) {
                return Image.asset(
                  "assets/images/load.png",
                  height: 40,
                  width: 40,
                );
              }),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(description
                        .replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ''),
                    maxLines: 1,
                    style: const TextStyle(fontSize: 10)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          width: 118,
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
              backgroundColor: const Color.fromARGB(255, 238, 235, 238),
            ),
            onPressed: () {},
            child: const Text(
              'ADD TO CART',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(name,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ]),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('$price LBP',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

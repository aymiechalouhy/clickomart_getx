import 'package:flutter/material.dart';

class CustomCollection extends StatelessWidget {
  final String name;
  final String price;
  final String discount;
  final String discountPrice;
  final String image;
  final String description;

  const CustomCollection({
    required this.price,
    required this.description,
    required this.discount,
    required this.discountPrice,
    required this.image,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 191,
            width: 122,
            color: Colors.white,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Text( '-'
                          '$discount LBP',
                          style:
                              const TextStyle(color: Colors.black, fontSize: 9.5),
                        ),
                      ),
                    ]),
                Column(children: [
                  IconButton(
                      icon: (const Icon(Icons.favorite)),
                      color: Colors.blue,
                      onPressed: () {}),
                ]),
              ]),
              // Image.network(image.toString()),
              Image.network(
                "${image.toString().replaceAll(RegExp(r'clickomart-s3-eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r'clickomart\.s3\.eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r'clickomart\.s3-eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r's3\.eu-central-1\.amazonaws\.com\/clickomart'), 'clickomart.imgix.net')}?w=200&auto=enhance,format",
                errorBuilder: (ctx, o, n) {
                  return Image.asset(
                    "assets/images/load.png",
                    height: 100,
                    width: 100,
                  );
                },
                height: 100,
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0, top: 6, bottom: 17),
                child: Text(
                  description.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ''),
                  maxLines: 1,
                  style: const TextStyle(color: Colors.black, fontSize: 11),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ]),
          ),
        ),
        SizedBox(
          height: 39,
          width: 122,
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
              backgroundColor: const Color.fromARGB(255, 238, 235, 238),
            ),
            onPressed: () {
            },
            child: const Text('ADD TO CART'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Container(
            color: Colors.white10,
            height: 100,
            width: 123,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      name,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: Text(
                      '$price LBP',
                      style: const TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 1,
                        decorationColor: Colors.blue,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text('$discountPrice LBP',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

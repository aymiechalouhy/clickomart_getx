import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:testclickomart/widgets/onecollection.dart';
import 'package:testclickomart/controller/argumentscontroller.dart';
import 'package:testclickomart/controller/relatedproductcontroller.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  RelatedProductController relatedProductController = Get.put(RelatedProductController());
  @override
  Widget build(BuildContext context) {
    ArgumentController controller = Get.put(ArgumentController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCollection(
              name: "${controller.name}",
              discount: "${controller.discount}",
              discountPrice: "${controller.discountPrice}",
              image:"${controller.image?.replaceAll(RegExp(r'clickomart-s3-eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r'clickomart\.s3\.eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r'clickomart\.s3-eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r's3\.eu-central-1\.amazonaws\.com\/clickomart'), 'clickomart.imgix.net')}?w=400&auto=enhance,format",
              description: "${controller.description?.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '')}",
              price: "${controller.price}",
            ),
            const SizedBox(
              height: 20,
            ),
            // Container(
            //   height: 60,
            //   width: double.infinity,
            //   color: Colors.blue,
            //   child: const Padding(
            //     padding: EdgeInsets.only(top: 15, left: 30),
            //     child: Text("Related Products",
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold)),
            //   ),
            // ), 
          ],
        ),
      ),
    );
  }
}

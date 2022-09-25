import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:testclickomart/widgets/onecollection.dart';
import 'package:testclickomart/controller/collectioncontroller.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    CollectionController controller = Get.put(CollectionController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: CustomCollection(
          name: "${controller.name}",
          discount: "${controller.discount}",
          discountPrice: "${controller.discountPrice}",
          image:
              "${controller.image?.replaceAll(RegExp(r'clickomart-s3-eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r'clickomart\.s3\.eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r'clickomart\.s3-eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r's3\.eu-central-1\.amazonaws\.com\/clickomart'), 'clickomart.imgix.net')}?w=400&auto=enhance,format",
          description: "${controller.description}",
          price: "${controller.price}",
        ),
      ),
    );
  }
}

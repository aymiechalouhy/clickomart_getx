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
    return  Scaffold(
      body: CustomCollection(
        description: "${controller.id}",
        discount: "hii",
        discountPrice:"ya hala" ,
        image: "",
        name:"" , 
        price: ""),
    );
  }
}
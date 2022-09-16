import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:testclickomart/controller/argumentscontroller.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
 
  @override
  Widget build(BuildContext context) {
     ArgumentController controller = Get.put(ArgumentController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Details"),
      ),
      body: Column(children: [
        Text("${controller.name}"),
        Text("${controller.subcategories}")
      ],),
    );
  }
}
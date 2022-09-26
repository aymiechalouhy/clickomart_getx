import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:testclickomart/view/categories.dart';
import 'package:testclickomart/view/categorydetails.dart';
import 'package:testclickomart/view/home.dart';
import 'package:testclickomart/view/productdetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      getPages: [
        GetPage(name: "/home", page: (() => const HomePage())),
        GetPage(name: "/categories", page: (() => const CategoriesInfo())),
        GetPage(name: "/categoryDetails", page: (() => const CategoryDetails())),
        GetPage(name: "/productDetails", page: (() => const ProductDetails())),
      ],
    );
  }
}
// flutter build apk --build-name=1.0 --build-number=1

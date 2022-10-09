import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testclickomart/view/btm.dart';
import 'package:testclickomart/view/cart.dart';
import 'package:testclickomart/view/home.dart';
import 'package:testclickomart/view/search.dart';
import 'package:testclickomart/view/profile.dart';
import 'package:testclickomart/view/favorite.dart';
import 'package:testclickomart/view/categories.dart';
import 'package:testclickomart/view/productdetails.dart';
import 'package:testclickomart/view/categorydetails.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.blue,));
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
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: (() => const BTM())),
        GetPage(name: "/home", page: (() => const HomePage())),
        GetPage(name: "/categories", page: (() => const Categories())),
        GetPage(name: "/categoryDetails", page: (() => const CategoryDetails())),
        GetPage(name: "/productDetails", page: (() => const ProductDetails())),
        GetPage(name: "/favorite", page: (() => const FavPage())),
        GetPage(name: "/search", page: (() => const SearchPage())),
        GetPage(name: "/profile", page: (() => const Profile())),
        GetPage(name: "/cart", page: (() => const Cart())),
      ],
    );
  }
}
// flutter build apk --build-name=1.0 --build-number=1

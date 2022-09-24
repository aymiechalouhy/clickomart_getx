import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:testclickomart/view/categories.dart';
import 'package:testclickomart/view/home.dart';

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
        GetPage(name: "/cat", page: (() => const CategoriesInfo())),
      ],
    );
  }
}
// flutter build apk --build-name=1.0 --build-number=1

// ! This is a very critical comment
// * This is a highlight comment
// TODO: This is a TODO comment
// ? this isa question comment
// This is a normal Comment
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:testclickomart/view/categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body:  SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
           Text("Hello World", style: TextStyle(fontSize: 50, color: Colors.blue),)
          ],
        ),
      ),
    );
  }
}
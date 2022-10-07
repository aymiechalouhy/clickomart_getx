import 'package:flutter/material.dart';
import 'package:testclickomart/widgets/custom_appbar.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(246, 255, 254, 254),
        appBar:AppBar(
          toolbarHeight: 80,
          flexibleSpace: const CustomPaint(
            painter: MyCustomPainter(),
            size: Size.infinite,
          ),
          title: Transform.translate(
            offset: const Offset(0, 5),
            child:Padding(
              padding: const EdgeInsets.only(left:130),
              child: Image.asset("assets/images/logo.png", height: 60, width: 60),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
         ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: Icon(Icons.favorite,
                      size: 80, color: Colors.blue),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Save your favorite products here",
                    style: TextStyle(
                      fontSize: 23,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 218,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

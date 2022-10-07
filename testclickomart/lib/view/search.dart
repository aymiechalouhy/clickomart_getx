// import 'package:clickomart/widgets/custom_bottomNb.dart';
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testclickomart/widgets/custom_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,
                          color: Colors.blue, size: 32),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color.fromARGB(246, 255, 254, 254),
                        ),
                      ),
                      hintText: 'Search for Products...'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25, right: 120),
              child: Text(
                "Popular Searches",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                  height: 1,
                  width: 300,
                  color: const Color.fromARGB(255, 173, 173, 169)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: const Color.fromARGB(230, 2, 2, 2),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Text(
                    'Labneh',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
             Container(
                  height: 1,
                  width: 300,
                  color: const Color.fromARGB(255, 173, 173, 169)),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: const Color.fromARGB(230, 2, 2, 2),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Text(
                    'Coffee',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ), Container(
                  height: 1,
                  width: 300,
                  color: const Color.fromARGB(255, 173, 173, 169)),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: const Color.fromARGB(230, 2, 2, 2),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Text(
                    'Cheese',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ),
            Container(
                  height: 1,
                  width: 300,
                  color: const Color.fromARGB(255, 173, 173, 169)),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: const Color.fromARGB(230, 2, 2, 2),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Text(
                    'Yogurt',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
             Container(
                  height: 1,
                  width: 300,
                  color: const Color.fromARGB(255, 173, 173, 169)),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: const Color.fromARGB(230, 2, 2, 2),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Text(
                    'Chocolate',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            "assets/images/msg.svg",
                            height: 60,
                            width: 60,
                            color:  const Color.fromRGBO(91, 189, 146, 1),
                          )
                        ],
                      ),
                      Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 7),
                            child: Text(
                              "Can't find what you are \n looking for?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 110),
                            child: Text("Let us help you"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 130),
              child: SizedBox(
                height: 45,
                width: 200,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                  onPressed: () {
                    launchWhatsapp(
                        number: "+96178954042", message: "Hello There!");
                  },
                  label: const Text("Contact Us",
                      style: TextStyle(
                        fontSize: 17,
                      )),
                  icon: const Icon(Icons.whatsapp),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

void launchWhatsapp({@required number, @required message}) async {
  String url = "whatsapp://send?phone=$number&text=$message";

  await canLaunch(url) ? launch(url) : debugPrint("Can't open whatsApp");
}

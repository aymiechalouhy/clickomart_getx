
import '../view/home.dart';
import '../view/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:testclickomart/view/cart.dart';
import 'package:testclickomart/view/search.dart';
import 'package:testclickomart/view/profile.dart';
import 'package:testclickomart/view/favorite.dart';

class BTM extends StatefulWidget {
  const BTM({Key? key}) : super(key: key);

  @override
  State<BTM> createState() => _BTMState();
}

class _BTMState extends State<BTM> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: Colors.white,
            activeColor: Colors.blue,
            inactiveColor: const Color.fromARGB(228, 159, 203, 240),
            iconSize: 40,
            height: 60,
            border: const Border(
                top: BorderSide(width: 1, color: Colors.grey),
                bottom: BorderSide(width: 16, color: Colors.blue)),
            currentIndex: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '',
              ),
                BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: '',
              ),
               BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
          ),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return CupertinoTabView(builder: (context) {
                  return const CupertinoPageScaffold(
                    child: Categories(),
                  );
                });
              case 1:
                return CupertinoTabView(builder: (context) {
                  return const CupertinoPageScaffold(
                    child: FavPage(),
                  );
                });
                 case 2:
                return CupertinoTabView(builder: (context) {
                  return const CupertinoPageScaffold(
                    child: Cart(),
                  );
                });
                  case 3:
                return CupertinoTabView(builder: (context) {
                  return const CupertinoPageScaffold(
                    child: SearchPage(),
                  );
                });
                   case 4:
                return CupertinoTabView(builder: (context) {
                  return const CupertinoPageScaffold(
                    child: Profile(),
                  );
                });
              default:
                return CupertinoTabView(builder: (context) {
                  return const CupertinoPageScaffold(
                    child: HomePage(),
                  );
                });
            }
          },
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     onTabTapped(0);
        //   },
        //   tooltip: "Message",
        //   elevation: 4.0,
        //   backgroundColor: Colors.blue,
        //   child: const Icon(Icons.shopping_cart, color: Colors.white),
        // ),
      ),
    );
  }

  // void onTabTapped(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }
}

import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shopping Cart"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Column(children: [
              SizedBox(
                height: 100,
                width: 290,
                child: Row(children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.shopping_cart,
                          size: 50,
                          color: Colors.deepOrange,
                        ),
                      ]),
                  Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 38, left: 10),
                        child: Text(
                          "My cart!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 90,
                  width: 320,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(children: [
                          Image.asset(
                            "assets/images/ssp.png",
                            height: 60,
                            width: 60,
                          ),
                        ]),
                        Column(children: const [
                          Text("Pen Vector, pen",
                              style: TextStyle(fontSize: 12)),
                          Text("Royalty this pen",
                              style: TextStyle(fontSize: 12)),
                          Padding(
                            padding: EdgeInsets.only(top: 4, right: 20),
                            child: Text("20.750 LBP",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                )),
                          ),
                        ]),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 20),
                            child: Container(
                              height: 60,
                              width: 130,
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4),
                                              child: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (count > 0) {
                                                     count--;
                                                      }
                                                    });
                                                  },
                                                  icon:
                                                      const Icon(Icons.remove),
                                                  color: Colors.white,
                                                  iconSize: 20)),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Column(
                                          children: [
                                            Text(
                                              "$count",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 4),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  count = count + 1;
                                                });
                                              },
                                              icon: const Icon(Icons.add),
                                              color: Colors.white,
                                              iconSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 180,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                onPressed: () {},
                child: const Text('Continue Shopping'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 180,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                onPressed: () {},
                child: const Text('Clear'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 180,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
                onPressed: () {},
                child: const Text(
                  'Suggest a product',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

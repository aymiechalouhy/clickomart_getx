import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:testclickomart/controller/categoriescontroller.dart';
import 'package:testclickomart/controller/offerscontroller.dart';
import 'package:testclickomart/view/categorydetails.dart';
import 'package:testclickomart/view/productdetails.dart';
import 'package:testclickomart/widgets/collections.dart';

class CategoriesInfo extends StatefulWidget {
  const CategoriesInfo({super.key});

  @override
  State<CategoriesInfo> createState() => _CategoriesInfoState();
}

class _CategoriesInfoState extends State<CategoriesInfo> {
  CategoriesController categoriesController = Get.put(CategoriesController());
  OffersController offersController = Get.put(OffersController());

  @override
  void initState() {
    super.initState();
    categoriesController.getCategoriesFromApi();
    offersController.getOffersFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Obx(
            () => categoriesController.isDataLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 5,
                                mainAxisExtent: 150),
                        itemBuilder: ((context, i) {
                          String logo = '';
                          String name = '';
                          try {
                            logo = categoriesController.cat!
                                .elementAt(i)
                                .logo
                                .toString();
                          } catch (e) {
                            logo = '';
                          }
                          try {
                            name = categoriesController.cat!
                                .elementAt(i)
                                .name
                                .toString();
                          } catch (e) {
                            name = '';
                          }
                          return InkWell(
                            onTap: (() =>
                                Get.to(const CategoryDetails(), arguments: {
                                  "id":
                                      "${categoriesController.cat!.elementAt(i).sId}",
                                })),
                            child: Column(
                              children: [
                                Image.network(
                                  "${logo.replaceAll(RegExp(r'clickomart-s3-eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r'clickomart\.s3\.eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r'clickomart\.s3-eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r's3\.eu-central-1\.amazonaws\.com\/clickomart'), 'clickomart.imgix.net')}?w=200&auto=enhance,format",
                                  height: 100,
                                  width: 100,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      "assets/images/load.png",
                                      height: 100,
                                      width: 100,
                                    );
                                  },
                                ),
                                Text(
                                  name,
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          );
                        }),
                        itemCount: categoriesController.cat!.length)),
          ),
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.blue,
            child: const Padding(
              padding: EdgeInsets.only(top: 15, left: 30),
              child: Text("New Products",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Obx(
            () => offersController.isLoading.value
                ? const CircularProgressIndicator()
                : SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 350,
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            mainAxisExtent: 115, // l3ared
                                            mainAxisSpacing: 10),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: ((context, indexNewProducts) {
                                      String name = '';
                                      String discount = '';
                                      String image;
                                      String description = '';
                                      String price = '';
                                      String discountPrice = '';
                                      try {
                                        name = offersController.products!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexNewProducts)
                                            .name
                                            .toString();
                                      } catch (e) {
                                        name = '';
                                      }

                                      try {
                                        discount = offersController.products!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexNewProducts)
                                            .discount
                                            .toString();
                                      } catch (e) {
                                        discount = '';
                                      }

                                      try {
                                        image = offersController.products!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexNewProducts)
                                            .image
                                            .toString();
                                      } catch (e) {
                                        image = '';
                                      }
                                      try {
                                        description = offersController.products!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexNewProducts)
                                            .description
                                            .toString();
                                      } catch (e) {
                                        description = '';
                                      }

                                      try {
                                        price = offersController.products!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexNewProducts)
                                            .price
                                            .toString();
                                      } catch (e) {
                                        price = '';
                                      }

                                      try {
                                        discountPrice = offersController
                                            .products!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexNewProducts)
                                            .discountPrice
                                            .toString();
                                      } catch (e) {
                                        discountPrice = '';
                                      }
                                      return CustomCollection(
                                        price: price,
                                        description: description,
                                        discount: discount,
                                        discountPrice: discountPrice,
                                        image: image,
                                        name: name,
                                        onClicked: () {
                                          Get.to(() => const ProductDetails(),
                                  arguments: {
                                  "name":"${offersController.products!.elementAt(index).items!.elementAt(indexNewProducts).name}",
                                  "image":"${offersController.products!.elementAt(index).items!.elementAt(indexNewProducts).image}",
                                  "price":"${offersController.products!.elementAt(index).items!.elementAt(indexNewProducts).price}",
                                  "description":"${offersController.products!.elementAt(index).items!.elementAt(indexNewProducts).description}",  
                                  "discount":"${offersController.products!.elementAt(index).items!.elementAt(indexNewProducts).discount}",
                                  "discountPrice":"${offersController.products!.elementAt(index).items!.elementAt(indexNewProducts).discountPrice}",  
                                    });
                                        },
                                      );
                                    }),
                                    itemCount: offersController.products
                                        ?.elementAt(index)
                                        .items
                                        ?.length),
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: offersController.products?.length,
                    ),
                  ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.blue,
            child: const Padding(
              padding: EdgeInsets.only(top: 15, left: 30),
              child: Text("Weekly Offers",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Obx(
            () => offersController.isLoading.value
                ? const CircularProgressIndicator()
                : SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        // debugPrint(offersController.offers
                        //     ?.elementAt(index)
                        //     .name
                        //     .toString());
                        return Column(
                          children: [
                            SizedBox(
                              height: 350,
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            mainAxisExtent: 115, // l3ared
                                            mainAxisSpacing: 10),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: ((context, indexOffers) {
                                      String name = '';
                                      String discount = '';
                                      String image;
                                      String description = '';
                                      String price = '';
                                      String discountPrice = '';
                                      try {
                                        name = offersController.offers!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexOffers)
                                            .name
                                            .toString();
                                      } catch (e) {
                                        name = '';
                                      }

                                      try {
                                        discount = offersController.offers!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexOffers)
                                            .discount
                                            .toString();
                                      } catch (e) {
                                        discount = '';
                                      }

                                      try {
                                        image = offersController.offers!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexOffers)
                                            .image
                                            .toString();
                                      } catch (e) {
                                        image = '';
                                      }
                                      try {
                                        description = offersController.offers!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexOffers)
                                            .description
                                            .toString();
                                      } catch (e) {
                                        description = '';
                                      }

                                      try {
                                        price = offersController.offers!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexOffers)
                                            .price
                                            .toString();
                                      } catch (e) {
                                        price = '';
                                      }

                                      try {
                                        discountPrice = offersController.offers!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexOffers)
                                            .discountPrice
                                            .toString();
                                      } catch (e) {
                                        discountPrice = '';
                                      }
                                      return CustomCollection(
                                        price: price,
                                        description: description,
                                        discount: discount,
                                        discountPrice: discountPrice,
                                        image: image,
                                        name: name,
                                        onClicked: () {
                                          Get.to(() => const ProductDetails(),
                                              arguments: {
                                                "id":
                                                    "${offersController.offers!.elementAt(index).items!.elementAt(indexOffers).name}"
                                              });
                                        },
                                      );
                                    }),
                                    itemCount: offersController.offers
                                        ?.elementAt(index)
                                        .items
                                        ?.length),
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: offersController.offers?.length,
                    ),
                  ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.blue,
            child: const Padding(
              padding: EdgeInsets.only(top: 15, left: 30),
              child: Text("Featured Products",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Obx(
            () => offersController.isLoading.value
                ? const CircularProgressIndicator()
                : SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 350,
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            mainAxisExtent: 115, // l3ared
                                            mainAxisSpacing: 10),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        ((context, indexFeaturedProduct) {
                                      String name = '';
                                      String discount = '';
                                      String image;
                                      String description = '';
                                      String price = '';
                                      String discountPrice = '';
                                      try {
                                        name = offersController
                                            .featuredproducts!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFeaturedProduct)
                                            .name
                                            .toString();
                                      } catch (e) {
                                        name = '';
                                      }

                                      try {
                                        discount = offersController
                                            .featuredproducts!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFeaturedProduct)
                                            .discount
                                            .toString();
                                      } catch (e) {
                                        discount = '';
                                      }

                                      try {
                                        image = offersController
                                            .featuredproducts!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFeaturedProduct)
                                            .image
                                            .toString();
                                      } catch (e) {
                                        image = '';
                                      }
                                      try {
                                        description = offersController
                                            .featuredproducts!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFeaturedProduct)
                                            .description
                                            .toString();
                                      } catch (e) {
                                        description = '';
                                      }

                                      try {
                                        price = offersController
                                            .featuredproducts!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFeaturedProduct)
                                            .price
                                            .toString();
                                      } catch (e) {
                                        price = '';
                                      }

                                      try {
                                        discountPrice = offersController
                                            .featuredproducts!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFeaturedProduct)
                                            .discountPrice
                                            .toString();
                                      } catch (e) {
                                        discountPrice = '';
                                      }
                                      return CustomCollection(
                                        price: price,
                                        description: description,
                                        discount: discount,
                                        discountPrice: discountPrice,
                                        image: image,
                                        name: name,
                                        onClicked: () {
                                          Get.to(() => const ProductDetails(),
                                              arguments: {   "id":
                                                    "${offersController.featuredproducts!.elementAt(index).items!.elementAt(indexFeaturedProduct).sId}"});
                                        },
                                      );
                                    }),
                                    itemCount: offersController.featuredproducts
                                        ?.elementAt(index)
                                        .items
                                        ?.length),
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: offersController.featuredproducts?.length,
                    ),
                  ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.blue,
            child: const Padding(
              padding: EdgeInsets.only(top: 15, left: 30),
              child: Text("Fresh Picks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Obx(
            () => offersController.isLoading.value
                ? const CircularProgressIndicator()
                : SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 350,
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            mainAxisExtent: 115, // l3ared
                                            mainAxisSpacing: 10),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: ((context, indexFreshPicks) {
                                      String name = '';
                                      String discount = '';
                                      String image;
                                      String description = '';
                                      String price = '';
                                      String discountPrice = '';
                                      try {
                                        name = offersController.freshpicks!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFreshPicks)
                                            .name
                                            .toString();
                                      } catch (e) {
                                        name = '';
                                      }

                                      try {
                                        discount = offersController.freshpicks!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFreshPicks)
                                            .discount
                                            .toString();
                                      } catch (e) {
                                        discount = '';
                                      }

                                      try {
                                        image = offersController.freshpicks!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFreshPicks)
                                            .image
                                            .toString();
                                      } catch (e) {
                                        image = '';
                                      }
                                      try {
                                        description = offersController
                                            .freshpicks!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFreshPicks)
                                            .description
                                            .toString();
                                      } catch (e) {
                                        description = '';
                                      }

                                      try {
                                        price = offersController.freshpicks!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFreshPicks)
                                            .price
                                            .toString();
                                      } catch (e) {
                                        price = '';
                                      }

                                      try {
                                        discountPrice = offersController
                                            .freshpicks!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFreshPicks)
                                            .discountPrice
                                            .toString();
                                      } catch (e) {
                                        discountPrice = '';
                                      }
                                      return CustomCollection(
                                        price: price,
                                        description: description,
                                        discount: discount,
                                        discountPrice: discountPrice,
                                        image: image,
                                        name: name,
                                        onClicked: () {
                                          Get.to(() => const ProductDetails(),
                                              arguments: {
                                                "id":
                                                    "${offersController.freshpicks!.elementAt(index).items!.elementAt(indexFreshPicks).sId}"
                                              });
                                        },
                                      );
                                    }),
                                    itemCount: offersController.freshpicks
                                        ?.elementAt(index)
                                        .items
                                        ?.length),
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: offersController.freshpicks?.length,
                    ),
                  ),
          ),
        ]),
      ),
    );
  }
}

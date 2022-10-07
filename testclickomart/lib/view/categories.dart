import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:testclickomart/widgets/collections.dart';
import 'package:testclickomart/view/productdetails.dart';
import 'package:testclickomart/view/categorydetails.dart';
import 'package:testclickomart/controller/adscontroller.dart';
import 'package:testclickomart/controller/categoriescontroller.dart';
import 'package:testclickomart/controller/collectionscontroller.dart';
import 'package:testclickomart/controller/relatedproductcontroller.dart';
import 'package:testclickomart/widgets/custom_appbar.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  CategoriesController categoriesController = Get.put(CategoriesController());
  CollectionController collectionController = Get.put(CollectionController());
  RelatedProductController relatedProductController =
      Get.put(RelatedProductController());
  AdsController adsController = Get.put(AdsController());

  @override
  void initState() {
    super.initState();
    categoriesController.getCategoriesFromApi();
    collectionController.getOffersFromApi();
    adsController.getAdsFromApi();
    relatedProductController.getRelatedProductFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
       AppBar(
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Opening Hours \n',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: '8 AM - 9 PM'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(children: [
          //start
          // Obx(
          //   () => categoriesController.isDataLoading.value
          //       ? const Text("please wait")
          //       : ListView.builder(
          //               physics: const ScrollPhysics(),
          //               shrinkWrap: true,
          //               itemBuilder: ((context, i) {
          //                 String image = '';
          //                 try {
          //                   image = adsController.ads!
          //                       .elementAt(i)
          //                       .image
          //                       .toString();
          //                 } catch (e) {
          //                   image = '';
          //                 }
          //                 return SizedBox(
          //                   height: 300,
          //                   child: Row(
          //                     children: const[
          // ImageSlideshow(
          //   width: double.infinity,
          //   height: 200,
          //   initialPage: 0,
          //   indicatorColor: Colors.transparent,
          //   indicatorBackgroundColor: Colors.transparent,
          //   autoPlayInterval: 3000,
          //   isLoop: true,
          //   children: [
          //     Image.network(
          //       "${image.replaceAll(RegExp(r'clickomart-s3-eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r'clickomart\.s3\.eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r'clickomart\.s3-eu-central-1\.amazonaws\.com'), 'clickomart.imgix.net').replaceAll(RegExp(r's3\.eu-central-1\.amazonaws\.com\/clickomart'), 'clickomart.imgix.net')}?w=200&auto=enhance,format",
          //       fit: BoxFit.cover,
          //     ),
          //   ],
          //                       // ),
          //                     ],
          //                   ),
          //                 );
          //               }),
          //               itemCount: adsController.ads?.length),

          // ),
          //end
          Obx(
            () => categoriesController.isDataLoading.value
                ? GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 0,
                            mainAxisExtent: 150),
                    itemBuilder: ((context, i) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: Shimmer.fromColors(
                          baseColor: const Color.fromARGB(255, 235, 240, 243),
                          highlightColor: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                color: const Color.fromARGB(255, 235, 240, 243),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 15,
                                  width: 60,
                                  color:
                                      const Color.fromARGB(255, 235, 240, 243),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    itemCount: 12)
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
                        itemCount: categoriesController.cat?.length),
                  ),
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
            () => collectionController.isLoading.value
                ? SizedBox(
                    height: 250,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisExtent: 115, // l3ared
                                mainAxisSpacing: 10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.white,
                                  highlightColor:
                                      const Color.fromRGBO(245, 241, 241, 1),
                                  child: Container(
                                    height: 191,
                                    width: 122,
                                    color: Colors.white,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor:
                                      const Color.fromARGB(255, 238, 235, 238),
                                  highlightColor: Colors.white,
                                  child: Container(
                                    height: 39,
                                    width: 122,
                                    color: const Color.fromARGB(
                                        255, 238, 235, 238),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                        itemCount: 10),
                  )
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
                                        name = collectionController.products!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexNewProducts)
                                            .name
                                            .toString();
                                      } catch (e) {
                                        name = '';
                                      }

                                      try {
                                        discount = collectionController
                                            .products!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexNewProducts)
                                            .discount
                                            .toString();
                                      } catch (e) {
                                        discount = '';
                                      }

                                      try {
                                        image = collectionController.products!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexNewProducts)
                                            .image
                                            .toString();
                                      } catch (e) {
                                        image = '';
                                      }
                                      try {
                                        description = collectionController
                                            .products!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexNewProducts)
                                            .description
                                            .toString();
                                      } catch (e) {
                                        description = '';
                                      }

                                      try {
                                        price = collectionController.products!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexNewProducts)
                                            .price
                                            .toString();
                                      } catch (e) {
                                        price = '';
                                      }

                                      try {
                                        discountPrice = collectionController
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
                                                "name":
                                                    "${collectionController.products!.elementAt(index).items!.elementAt(indexNewProducts).name}",
                                                "image":
                                                    "${collectionController.products!.elementAt(index).items!.elementAt(indexNewProducts).image}",
                                                "price":
                                                    "${collectionController.products!.elementAt(index).items!.elementAt(indexNewProducts).price}",
                                                "description":
                                                    "${collectionController.products!.elementAt(index).items!.elementAt(indexNewProducts).description}",
                                                "discount":
                                                    "${collectionController.products!.elementAt(index).items!.elementAt(indexNewProducts).discount}",
                                                "discountPrice":
                                                    "${collectionController.products!.elementAt(index).items!.elementAt(indexNewProducts).discountPrice}",
                                              });
                                        },
                                      );
                                    }),
                                    itemCount: collectionController.products
                                        ?.elementAt(index)
                                        .items
                                        ?.length),
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: collectionController.products?.length,
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
            () => collectionController.isLoading.value
                ? SizedBox(
                    height: 250,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisExtent: 115, // l3ared
                                mainAxisSpacing: 10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.white,
                                  highlightColor:
                                      const Color.fromRGBO(245, 241, 241, 1),
                                  child: Container(
                                    height: 191,
                                    width: 122,
                                    color: Colors.white,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor:
                                      const Color.fromARGB(255, 238, 235, 238),
                                  highlightColor: Colors.white,
                                  child: Container(
                                    height: 39,
                                    width: 122,
                                    color: const Color.fromARGB(
                                        255, 238, 235, 238),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                        itemCount: 10),
                  )
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
                                        name = collectionController.offers!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexOffers)
                                            .name
                                            .toString();
                                      } catch (e) {
                                        name = '';
                                      }

                                      try {
                                        discount = collectionController.offers!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexOffers)
                                            .discount
                                            .toString();
                                      } catch (e) {
                                        discount = '';
                                      }

                                      try {
                                        image = collectionController.offers!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexOffers)
                                            .image
                                            .toString();
                                      } catch (e) {
                                        image = '';
                                      }
                                      try {
                                        description = collectionController
                                            .offers!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexOffers)
                                            .description
                                            .toString();
                                      } catch (e) {
                                        description = '';
                                      }

                                      try {
                                        price = collectionController.offers!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexOffers)
                                            .price
                                            .toString();
                                      } catch (e) {
                                        price = '';
                                      }

                                      try {
                                        discountPrice = collectionController
                                            .offers!
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
                                                "name":
                                                    "${collectionController.offers!.elementAt(index).items!.elementAt(indexOffers).name}",
                                                "image":
                                                    "${collectionController.offers!.elementAt(index).items!.elementAt(indexOffers).image}",
                                                "price":
                                                    "${collectionController.offers!.elementAt(index).items!.elementAt(indexOffers).price}",
                                                "description":
                                                    "${collectionController.offers!.elementAt(index).items!.elementAt(indexOffers).description}",
                                                "discount":
                                                    "${collectionController.offers!.elementAt(index).items!.elementAt(indexOffers).discount}",
                                                "discountPrice":
                                                    "${collectionController.offers!.elementAt(index).items!.elementAt(indexOffers).discountPrice}",
                                              });
                                        },
                                      );
                                    }),
                                    itemCount: collectionController.offers
                                        ?.elementAt(index)
                                        .items
                                        ?.length),
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: collectionController.offers?.length,
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
            () => collectionController.isLoading.value
                ? SizedBox(
                    height: 250,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisExtent: 115, // l3ared
                                mainAxisSpacing: 10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.white,
                                  highlightColor:
                                      const Color.fromRGBO(245, 241, 241, 1),
                                  child: Container(
                                    height: 191,
                                    width: 122,
                                    color: Colors.white,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor:
                                      const Color.fromARGB(255, 238, 235, 238),
                                  highlightColor: Colors.white,
                                  child: Container(
                                    height: 39,
                                    width: 122,
                                    color: const Color.fromARGB(
                                        255, 238, 235, 238),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                        itemCount: 10),
                  )
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
                                        name = collectionController
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
                                        discount = collectionController
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
                                        image = collectionController
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
                                        description = collectionController
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
                                        price = collectionController
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
                                        discountPrice = collectionController
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
                                              arguments: {
                                                "name":
                                                    "${collectionController.featuredproducts!.elementAt(index).items!.elementAt(indexFeaturedProduct).name}",
                                                "image":
                                                    "${collectionController.featuredproducts!.elementAt(index).items!.elementAt(indexFeaturedProduct).image}",
                                                "price":
                                                    "${collectionController.featuredproducts!.elementAt(index).items!.elementAt(indexFeaturedProduct).price}",
                                                "description":
                                                    "${collectionController.featuredproducts!.elementAt(index).items!.elementAt(indexFeaturedProduct).description}",
                                                "discount":
                                                    "${collectionController.featuredproducts!.elementAt(index).items!.elementAt(indexFeaturedProduct).discount}",
                                                "discountPrice":
                                                    "${collectionController.featuredproducts!.elementAt(index).items!.elementAt(indexFeaturedProduct).discountPrice}",
                                              });
                                        },
                                      );
                                    }),
                                    itemCount: collectionController
                                        .featuredproducts
                                        ?.elementAt(index)
                                        .items
                                        ?.length),
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: collectionController.featuredproducts?.length,
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
            () => collectionController.isLoading.value
                ? SizedBox(
                    height: 250,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisExtent: 115, // l3ared
                                mainAxisSpacing: 10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.white,
                                  highlightColor:
                                      const Color.fromRGBO(245, 241, 241, 1),
                                  child: Container(
                                    height: 191,
                                    width: 122,
                                    color: Colors.white,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor:
                                      const Color.fromARGB(255, 238, 235, 238),
                                  highlightColor: Colors.white,
                                  child: Container(
                                    height: 39,
                                    width: 122,
                                    color: const Color.fromARGB(
                                        255, 238, 235, 238),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                        itemCount: 10),
                  )
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
                                        name = collectionController.freshpicks!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFreshPicks)
                                            .name
                                            .toString();
                                      } catch (e) {
                                        name = '';
                                      }

                                      try {
                                        discount = collectionController
                                            .freshpicks!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFreshPicks)
                                            .discount
                                            .toString();
                                      } catch (e) {
                                        discount = '';
                                      }

                                      try {
                                        image = collectionController.freshpicks!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFreshPicks)
                                            .image
                                            .toString();
                                      } catch (e) {
                                        image = '';
                                      }
                                      try {
                                        description = collectionController
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
                                        price = collectionController.freshpicks!
                                            .elementAt(index)
                                            .items!
                                            .elementAt(indexFreshPicks)
                                            .price
                                            .toString();
                                      } catch (e) {
                                        price = '';
                                      }

                                      try {
                                        discountPrice = collectionController
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
                                                "name":
                                                    "${collectionController.freshpicks!.elementAt(index).items!.elementAt(indexFreshPicks).name}",
                                                "image":
                                                    "${collectionController.freshpicks!.elementAt(index).items!.elementAt(indexFreshPicks).image}",
                                                "price":
                                                    "${collectionController.freshpicks!.elementAt(index).items!.elementAt(indexFreshPicks).price}",
                                                "description":
                                                    "${collectionController.freshpicks!.elementAt(index).items!.elementAt(indexFreshPicks).description}",
                                                "discount":
                                                    "${collectionController.freshpicks!.elementAt(index).items!.elementAt(indexFreshPicks).discount}",
                                                "discountPrice":
                                                    "${collectionController.freshpicks!.elementAt(index).items!.elementAt(indexFreshPicks).discountPrice}",
                                              });
                                        },
                                      );
                                    }),
                                    itemCount: collectionController.freshpicks
                                        ?.elementAt(index)
                                        .items
                                        ?.length),
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: collectionController.freshpicks?.length,
                    ),
                  ),
          ),
        ]),
      ),
    );
  }
}

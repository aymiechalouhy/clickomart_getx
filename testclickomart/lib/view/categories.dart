import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:testclickomart/controller/relatedproductcontroller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:testclickomart/widgets/collections.dart';
import 'package:testclickomart/view/productdetails.dart';
import 'package:testclickomart/view/categorydetails.dart';
import 'package:testclickomart/controller/adscontroller.dart';
import 'package:testclickomart/controller/categoriescontroller.dart';
import 'package:testclickomart/controller/collectionscontroller.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  CategoriesController categoriesController = Get.put(CategoriesController());
  CollectionController offersController = Get.put(CollectionController());
  RelatedProductController relatedProductController =
      Get.put(RelatedProductController());
  AdsController adsController = Get.put(AdsController());

  @override
  void initState() {
    super.initState();
    categoriesController.getCategoriesFromApi();
    offersController.getOffersFromApi();
    adsController.getAdsFromApi();
    relatedProductController.getRelatedProductFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
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
                                  "id":"${categoriesController.cat!.elementAt(i).sId}",
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
            () => offersController.isLoading.value
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
                                                "name":
                                                    "${offersController.products!.elementAt(index).items!.elementAt(indexNewProducts).name}",
                                                "image":
                                                    "${offersController.products!.elementAt(index).items!.elementAt(indexNewProducts).image}",
                                                "price":
                                                    "${offersController.products!.elementAt(index).items!.elementAt(indexNewProducts).price}",
                                                "description":
                                                    "${offersController.products!.elementAt(index).items!.elementAt(indexNewProducts).description}",
                                                "discount":
                                                    "${offersController.products!.elementAt(index).items!.elementAt(indexNewProducts).discount}",
                                                "discountPrice":
                                                    "${offersController.products!.elementAt(index).items!.elementAt(indexNewProducts).discountPrice}",
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
                                                "name":
                                                    "${offersController.offers!.elementAt(index).items!.elementAt(indexOffers).name}",
                                                "image":
                                                    "${offersController.offers!.elementAt(index).items!.elementAt(indexOffers).image}",
                                                "price":
                                                    "${offersController.offers!.elementAt(index).items!.elementAt(indexOffers).price}",
                                                "description":
                                                    "${offersController.offers!.elementAt(index).items!.elementAt(indexOffers).description}",
                                                "discount":
                                                    "${offersController.offers!.elementAt(index).items!.elementAt(indexOffers).discount}",
                                                "discountPrice":
                                                    "${offersController.offers!.elementAt(index).items!.elementAt(indexOffers).discountPrice}",
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
                                              arguments: {
                                                "name":
                                                    "${offersController.featuredproducts!.elementAt(index).items!.elementAt(indexFeaturedProduct).name}",
                                                "image":
                                                    "${offersController.featuredproducts!.elementAt(index).items!.elementAt(indexFeaturedProduct).image}",
                                                "price":
                                                    "${offersController.featuredproducts!.elementAt(index).items!.elementAt(indexFeaturedProduct).price}",
                                                "description":
                                                    "${offersController.featuredproducts!.elementAt(index).items!.elementAt(indexFeaturedProduct).description}",
                                                "discount":
                                                    "${offersController.featuredproducts!.elementAt(index).items!.elementAt(indexFeaturedProduct).discount}",
                                                "discountPrice":
                                                    "${offersController.featuredproducts!.elementAt(index).items!.elementAt(indexFeaturedProduct).discountPrice}",
                                              });
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
                                                "name":
                                                    "${offersController.freshpicks!.elementAt(index).items!.elementAt(indexFreshPicks).name}",
                                                "image":
                                                    "${offersController.freshpicks!.elementAt(index).items!.elementAt(indexFreshPicks).image}",
                                                "price":
                                                    "${offersController.freshpicks!.elementAt(index).items!.elementAt(indexFreshPicks).price}",
                                                "description":
                                                    "${offersController.freshpicks!.elementAt(index).items!.elementAt(indexFreshPicks).description}",
                                                "discount":
                                                    "${offersController.freshpicks!.elementAt(index).items!.elementAt(indexFreshPicks).discount}",
                                                "discountPrice":
                                                    "${offersController.freshpicks!.elementAt(index).items!.elementAt(indexFreshPicks).discountPrice}",
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

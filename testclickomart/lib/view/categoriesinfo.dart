import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:testclickomart/controller/categoriescontroller.dart';
import 'package:testclickomart/controller/offerscontroller.dart';
import 'package:testclickomart/view/categorydetails.dart';

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
              child: Text("Offers",
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
                    height: 100,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        debugPrint(offersController.offers?.elementAt(index).name.toString());
                        return Column(
                          children: [
                            SizedBox(
                              height: 100,
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: ((context, indexOffers) {
                                      String name = '';
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
                                      debugPrint(name.toString());
                                      return Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 2),
                                            child: SizedBox(
                                              height: 100,
                                              width: 123,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Text(name),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
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
        ]),
      ),
    );
  }
}
// Obx(() => offersController.isLoading.value
//         ? const  CircularProgressIndicator()
//         : Expanded(
//           child: ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return Column(
//                   children: [
//                     // Text(offersController.offers?.elementAt(index).name.toString()),
//                     SizedBox(
//                       height: 460,
//                       child: GridView.builder(
//                         shrinkWrap: true,
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 1,
//                                 mainAxisExtent: 115,
//                                 mainAxisSpacing: 10),
//                         itemBuilder: ((context, indexOffers) {
//                           String name = '';
//                           try {
//                             name = offersController.offers!
//                                 .elementAt(index)
//                                 .items!
//                                 .elementAt(indexOffers)
//                                 .name
//                                 .toString();
//                           } catch (e) {
//                             name = '';
//                           }
//                           return Column(
//                             children: [
//                               SizedBox(
//                                 height: 100,
//                                 width: 123,
//                                 child: Column(
//                                   children: [
//                                     Text(name),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }),
//                         itemCount: offersController.offers?.elementAt(index).items?.length,
//                       ),
//                     )
//                   ],
//                 );
//               },
//               itemCount: offersController.offers?.length),
//         ),
//   ),

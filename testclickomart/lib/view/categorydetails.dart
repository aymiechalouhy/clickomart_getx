import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:testclickomart/widgets/itemswidget.dart';
import 'package:testclickomart/controller/itemscontroller.dart';
import 'package:testclickomart/controller/argumentscontroller.dart';
import 'package:testclickomart/controller/categoriescontroller.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedCategoryIndex = 0;
  int selectedSubcategories = 0;
  final scrollMaincategories = ItemScrollController();
  ItemsController itemsController = Get.put(ItemsController());
  ArgumentController controller = Get.put(ArgumentController());
  CategoriesController categoriesController = Get.put(CategoriesController());

  @override
  void initState() {
    super.initState();
    categoriesController.getCategoriesFromApi();
    debugPrint(controller.id);
    itemsController.getItemsFromApi(controller.id);
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(categoriesController.cat!.toList().length.toString());
    // for (var element in categoriesController.cat!.toList()) {
    //   debugPrint(element.sId);
    //   debugPrint(controller.id?.trim());
    // }
    selectedCategoryIndex = categoriesController.cat!
        .toList()
        .indexWhere((element) => element.sId == controller.id?.trim());

    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollMaincategories.scrollTo(
          index: selectedCategoryIndex,
          duration: const Duration(milliseconds: 500));
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Category Details")),
      body: SingleChildScrollView(
          child: Column(
        children: [
          categoriesController.isDataLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 150,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const CategoryDetails());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ScrollablePositionedList.builder(
                            itemScrollController: scrollMaincategories,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, i) {
                              final isSelected = selectedCategoryIndex == i;
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
                              return Column(
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: InkWell(
                                      onTap: (() {
                                        setState(() {
                                          selectedCategoryIndex == i;
                                        });
                                      }),
                                      child: Text(
                                        name,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: isSelected
                                                ? Colors.blue
                                                : Colors.black,
                                            fontWeight: isSelected
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                            itemCount: categoriesController.cat!.length),
                      ),
                    ),
                  )),
          // ),
          SizedBox(
            height: 60,
            child: ScrollablePositionedList.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final isSelected = selectedSubcategories == index;
                  return TextButton(
                    onPressed: () {
                      debugPrint("Pressed");
                      setState(() {
                        selectedSubcategories == index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.white10,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              onPressed: (() {}),
                              child: Text(
                                categoriesController.cat!
                                    .elementAt(selectedCategoryIndex)
                                    .subcategories!
                                    .elementAt(index)
                                    .name!
                                    .trim(),
                                style: TextStyle(
                                  fontSize: 14,
                                    color: isSelected ? Colors.white : Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: categoriesController.cat!
                    .elementAt(selectedCategoryIndex)
                    .subcategories!
                    .length),
          ),
          SizedBox(
            height: 450,
            child: ScrollablePositionedList.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final subCategItems = itemsController.getItemsOfSubCategory(
                      categoriesController.cat!
                          .elementAt(selectedCategoryIndex)
                          .subcategories!
                          .elementAt(index)
                          .sId);
                  // debugPrint(subCategItems.toString());
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categoriesController.cat!.elementAt(selectedCategoryIndex)
                              .subcategories!.elementAt(index).name.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Column(
                          children: [
                            !itemsController.isDataLoading.value
                                ? GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisExtent: 290,
                                            mainAxisSpacing: 20,
                                            crossAxisSpacing: 10),
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, itemIndex) {
                                      String name = '';
                                      String image = '';
                                      String description = '';
                                      String price = '';
                                      String discount = '';
                                      String discountprice = '';
                                      // debugPrint(itemsController.items?.toString());
                                      try {
                                        name = subCategItems!
                                            .elementAt(itemIndex)
                                            .name
                                            .toString();
                                      } catch (e) {
                                        name = '';
                                      }
                                      try {
                                        image = subCategItems!
                                            .elementAt(itemIndex)
                                            .image
                                            .toString();
                                      } catch (e) {
                                        image = '';
                                      }
                                      try {
                                        description = subCategItems!
                                            .elementAt(itemIndex)
                                            .description
                                            .toString();
                                      } catch (e) {
                                        description = '';
                                      }
                                      try {
                                        price = subCategItems!
                                            .elementAt(itemIndex)
                                            .price
                                            .toString();
                                      } catch (e) {
                                        price = '';
                                      }
                                      try {
                                        discount = subCategItems!
                                            .elementAt(itemIndex)
                                            .discount
                                            .toString();
                                      } catch (e) {
                                        discount = '';
                                      }
                                      try {
                                        discountprice = subCategItems!
                                            .elementAt(itemIndex)
                                            .discountPrice
                                            .toString();
                                      } catch (e) {
                                        discountprice = '';
                                      }
                                      return Column(
                                        children: [
                                         Padding(
                                          padding:const EdgeInsets.only(top: 10),
                                              child:
                                              CustomItems(
                                                    price: price,
                                                    description: description,
                                                    discount: discount,
                                                    discountPrice: discountprice,
                                                    image: image,
                                                    name: name
                                                    ),
                                            )
                                        ],
                                      );
                                    },
                                    itemCount: subCategItems?.length,
                                  )
                                : GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisExtent: 290,
                                            mainAxisSpacing: 20,
                                            crossAxisSpacing: 10
                                            ),
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, itemIndex) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Column(
                                              children: [
                                                Shimmer.fromColors(
                                                  baseColor: Colors.white,
                                                  highlightColor:
                                                      Colors.white24,
                                                  child: Container(
                                                      height: 155,
                                                      width: 120,
                                                      color: Colors.white),
                                                ),
                                                Shimmer.fromColors(
                                                  baseColor:
                                                      const Color.fromARGB(
                                                          242, 238, 235, 238),
                                                  highlightColor: Colors.white,
                                                  child: Container(
                                                    height: 40,
                                                    width: 120,
                                                    color: const Color.fromARGB(
                                                        242, 238, 235, 238),
                                                  ),
                                                ),
                                                Shimmer.fromColors(
                                                  baseColor: Colors.white38,
                                                  highlightColor: Colors.white,
                                                  child: Container(
                                                      height: 60,
                                                      width: 120,
                                                      color: Colors.white38),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                    itemCount: 6,
                                  )
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: categoriesController.cat!
                    .elementAt(selectedCategoryIndex)
                    .subcategories!
                    .length),
          ),
        ],
      )),
    );
  }
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
  CategoriesController categoriesController = Get.put(CategoriesController());

  @override
  void initState() {
    super.initState();
    categoriesController.getCategoriesFromApi();
  }

  @override
  Widget build(BuildContext context) {
    ArgumentController controller = Get.put(ArgumentController());
    // debugPrint(categoriesController.cat!.toList().length.toString());
    // for (var element in categoriesController.cat!.toList()) {
    //   debugPrint(element.sId);
    //   debugPrint(controller.id?.trim());
    //   debugPrint((element.sId == controller.id?.trim()).toString());
    // }
    selectedCategoryIndex = categoriesController.cat!
        .toList()
        .indexWhere((element) => element.sId == controller.id?.trim());
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
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ScrollablePositionedList.builder(
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
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                            itemCount: categoriesController.cat!.length),
                      ),
                    )),
            
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                                children: [
                                      MaterialButton(
                                      onPressed: (){},
                                      child:Text(categoriesController.cat!
                                          .elementAt(selectedCategoryIndex)
                                          .subcategories!
                                          .elementAt(index)
                                          .name
                                          .toString()),
                                       ),
                                ],
                              );
                      },
                      itemCount: categoriesController.cat!
                          .elementAt(selectedCategoryIndex)
                          .subcategories!
                          .length),
                ), 


                SizedBox(
                  height: 450,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return 
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 10),
                          child: Text(categoriesController.cat!
                                  .elementAt(selectedCategoryIndex)
                                  .subcategories!
                                  .elementAt(index)
                                  .name
                                  .toString(),style:const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),),
                            
                        );
                      },
                      itemCount: categoriesController.cat!
                          .elementAt(selectedCategoryIndex)
                          .subcategories!
                          .length),
                )
          ],
        ),
      ),
    );
  }
}

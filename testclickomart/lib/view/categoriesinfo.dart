import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:testclickomart/controller/categoriescontroller.dart';
import 'package:testclickomart/controller/offerscontroller.dart';

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
          child: Column(
            children: [
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
                                logo = categoriesController
                                    .cat!.response![i].logo
                                    .toString();
                              } catch (e) {
                                logo = '';
                              }
                              try {
                                name = categoriesController
                                    .cat!.response![i].name
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
                                  Text(
                                    name,
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ],
                              );
                            }),
                            itemCount:
                                categoriesController.cat!.response!.length),
                      ),
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

             Obx(() => offersController.isLoading.value
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
                              String name = '';
                              try {
                                name = offersController.offers!.response![i].name.toString();
                              } catch (e) {
                                name = '';
                              }
                              return Column(
                                children: [
                                  Text(name, style: const TextStyle(fontSize: 10),
                                  ),
                                ],
                              );
                            }),
                            itemCount: offersController.offers!.response!.length),
                      ),
              ),


            ],
          ),
        ));
  }
}

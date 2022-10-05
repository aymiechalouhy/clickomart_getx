import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:testclickomart/model/collectionmodel.dart' as collection_model;

class CollectionController extends GetxController {
  Iterable<collection_model.Response>? offers;
  Iterable<collection_model.Response>? products;
  Iterable<collection_model.Response>? featuredproducts;
  Iterable<collection_model.Response>? freshpicks;
  //false
  var isLoading = false.obs;

  getOffersFromApi() async {
    try {
      isLoading(true);
      http.Response response = await http.post(
          Uri.tryParse('https://be.clickomart.com/api/v1/itemCollections/get')!,
          headers: {
            HttpHeaders.authorizationHeader: '22D196EC5C6F345377A67AD9F4BDDF',
          });
      if (response.statusCode == 200) {
        
        var result = json.decode(utf8.decode(response.bodyBytes));

        offers = collection_model.Offers.fromJson(result)
            .response!
            .where((element) => element.slug == "weekly-offers")
            .toList();

        products = collection_model.Offers.fromJson(result)
            .response!
            .where((element) => element.slug == "new-products")
            .toList();

        featuredproducts = collection_model.Offers.fromJson(result)
            .response!
            .where((element) => element.slug == "featured-products")
            .toList();

        freshpicks = collection_model.Offers.fromJson(result)
            .response!
            .where((element) => element.slug == "fresh-picks")
            .toList();

      } else {
        debugPrint("Response code not 200");
      }
    } catch (e) {
      debugPrint("Error while getting Data $e");
    } finally {
      //false
      isLoading(false);
    }
  }
}

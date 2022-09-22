import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:testclickomart/model/offersmodel.dart' as offers_model;

class OffersController extends GetxController {
  Iterable<offers_model.Response>? offers;
  var isLoading = false.obs;

  getOffersFromApi() async {
    try {
      isLoading(true);
      debugPrint("Getting Offers");
      http.Response response = await http.post(
          Uri.tryParse('https://be.clickomart.com/api/v1/itemCollections/get')!,
          headers: {
            HttpHeaders.authorizationHeader: '22D196EC5C6F345377A67AD9F4BDDF',
          });
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        offers = offers_model.Offers.fromJson(result)
            .response!
            .where((element) => element.slug == "weekly-offers")
            .toList();
        // debugPrint(offers.toString());
      } else {
        debugPrint("Response code not b200");
      }
    } catch (e) {
      debugPrint("Error while getting Data $e");
    } finally {
      isLoading(false);
    }
  }
}

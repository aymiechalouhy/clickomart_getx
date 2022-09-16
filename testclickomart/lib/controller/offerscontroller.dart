import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:testclickomart/model/offersmodel.dart';

class OffersController extends GetxController {
  Offers? offers;
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
        var result = jsonDecode(response.body);
        offers = Offers.fromJson(result);
      } else {}
    } catch (e) {
      debugPrint("Error while getting Data $e");
    } finally {
      isLoading(false);
    }
  }
}

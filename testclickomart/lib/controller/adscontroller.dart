import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/adsmodel.dart' as ads_model;

class AdsController extends GetxController {
  Iterable<ads_model.Response>? ads;
  var isDataLoading = true.obs;

  getAdsFromApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.post(
          Uri.tryParse('https://be.clickomart.com//api/v1/ads')!,
          headers: {
            HttpHeaders.authorizationHeader: '22D196EC5C6F345377A67AD9F4BDDF',
          });
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        ads = ads_model.Ads.fromJson(result).response;
      } else {}
    } catch (e) {
      debugPrint("Error while getting Data $e");
    } finally {
      isDataLoading(false);
    }
  }
}

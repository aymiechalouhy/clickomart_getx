import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/relatedproductsmodel.dart' as relatedpro_model;

class RelatedProductController extends GetxController {
  Iterable<relatedpro_model.Response>? relatedpro;
  var isDataLoading = true.obs;

  getRelatedProductFromApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.post(
          Uri.tryParse('https://be.clickomart.com/api/v1/items/get')!,
          headers: {
            HttpHeaders.authorizationHeader: '22D196EC5C6F345377A67AD9F4BDDF',
          });
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        relatedpro = relatedpro_model.RelatedProducts.fromJson(result).response as Iterable<relatedpro_model.Response>? ;
      } else {}
    } catch (e) {
      debugPrint("Error while getting Data $e");
    } finally {
      //false
      isDataLoading(false);
    }
  }
}

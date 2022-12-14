import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/categoriesmodel.dart' as categories_model;

class CategoriesController extends GetxController {
  Iterable<categories_model.Response>? cat;
  //true
  var isDataLoading = true.obs;

  getCategoriesFromApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.post(
          Uri.tryParse(
              'https://be.clickomart.com/api/v1/categories/get_all_categories')!,
          headers: {
            HttpHeaders.authorizationHeader: '22D196EC5C6F345377A67AD9F4BDDF',
          });

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        cat = categories_model.Categories.fromJson(result).response;
      } else {}
    } catch (e) {
      debugPrint("Error while getting Data $e");
    } finally {
      //false
      isDataLoading(false);
    }
  }
}

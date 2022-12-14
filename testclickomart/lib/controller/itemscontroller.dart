import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/itemsmodel.dart' as items_model;

class ItemsController extends GetxController {
  var isDataLoading = false.obs;
  Iterable<items_model.Items>? items;

  getItemsOfSubCategory(subCategId) {
    if (items != null && items!.isNotEmpty) {
      return items!.where((element) => element.categoryIds!.contains(subCategId));
    }
    return null;
  }

  getItemsFromApi(String? categoryId) async {
    List<String> categIds = List.empty(growable: true);
    if (categoryId != null && categoryId.isNotEmpty) categIds.add(categoryId);
    Map<String, dynamic> body = {
      'limit': 20000,
      'page': 1,
    };
    if (categIds.isNotEmpty) {
      body["categoryIds"] = categIds;
    }
    try {
      isDataLoading(true);
      http.Response response = await http.post(
        Uri.tryParse('https://be.clickomart.com/api/v1/items/get/')!,
        headers: {
          HttpHeaders.authorizationHeader: '22D196EC5C6F345377A67AD9F4BDDF',
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(body),
      );
      // debugPrint(response.body);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        items = items_model.CategoryItems.fromJson(result).response?.items;
      }

    } catch (e) {
      debugPrint("Error while getting Data $e");
    } finally {
      isDataLoading(false);
    }
  }
}

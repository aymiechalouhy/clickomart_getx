import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/itemsmodel.dart' as items_model;

class ItemsController extends GetxController {

  // Map<String, List> items = <String, List>{};
  Iterable<items_model.Items>? items;
  var isDataLoading = false.obs;

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
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        items = items_model.CategoryItems.fromJson(result).response?.items;
      } else {}
    } catch (e) {
      debugPrint("Error while getting Data $e");
    } finally {
      isDataLoading(false);
    }

    // Map<String, List> indexedItems = <String, List>{};
    // for (var itemJson in itemsJson) {
    //   var oneItem = Items.fromJson(itemJson);
    //   for (String oneCat in oneItem.categoryIds) {
    //     if (indexedItems.containsKey(oneCat)) {
    //       indexedItems[oneCat]?.add(oneItem);
    //     } else {
    //       List<Items> itemsList = <Items>[];
    //       itemsList.add(oneItem);
    //       indexedItems.putIfAbsent(oneCat, () => itemsList);
    //     }
    //   }
    // }
  }
}
import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/itemsmodel.dart' as items_model;

class ItemsController extends GetxController {
  Iterable<items_model.Items>? items;

  var isDataLoading = false.obs;
  //  Map<String, List<items_model.Items>> indexedItems = <String, List<items_model.Items>>{};
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
      //true
      isDataLoading(true);
      http.Response response = await http.post(
        Uri.tryParse('https://be.clickomart.com/api/v1/items/get/')!,
        headers: {
          HttpHeaders.authorizationHeader: '22D196EC5C6F345377A67AD9F4BDDF',
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        items = items_model.CategoryItems.fromJson(result).response?.items;
        // indexedItems = items_model.CategoryItems.fromJson(result).response?.items as ;
      }
      
      // final Map<String, dynamic> responseJson = json.decode(utf8.decode(response.bodyBytes));
      // List itemsJson = responseJson["items"];
      // Map<String, List> indexedItems = <String, List>{};
      // for (var itemJson in itemsJson) {
      //   var oneItem = items_model.Items.fromJson(itemJson);
      //   for (String oneCat in oneItem.sId) {
      //   if (indexedItems.containsKey(oneCat)) {
      //     indexedItems[oneCat]?.add(oneItem);
      //   } else {
      //     List<items_model.Items> itemsList = <items_model.Items>[];
      //     itemsList.add(oneItem);
      //     indexedItems.putIfAbsent(oneCat, () => itemsList);
      //   }
      // }
      // }

    } catch (e) {
      debugPrint("Error while getting Data $e");
    } finally {
      isDataLoading(false);
    }
  }
}

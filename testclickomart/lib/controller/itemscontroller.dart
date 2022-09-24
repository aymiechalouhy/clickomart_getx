// import 'dart:io';
// import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;

class OffersController extends GetxController {

  var isLoading = false.obs;

  getItemsFromApi() async {
    try {
      isLoading(true);
    } catch (e) {
      debugPrint("Error while getting Data $e");
    } finally {
      isLoading(false);
    }
  }
}

import 'package:get/get.dart';

class ArgumentController extends GetxController {
  String? name;
  String? subcategories;

  @override
  void onInit() {
    name = Get.arguments['name'];
    subcategories = Get.arguments['subcategories'];
    super.onInit();
  }
}

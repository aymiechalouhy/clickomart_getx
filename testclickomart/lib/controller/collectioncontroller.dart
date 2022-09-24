import 'package:get/get.dart';

class CollectionController extends GetxController {
  String? id;

  @override
  void onInit() {
    id = Get.arguments['id'];
    super.onInit();
  }
}
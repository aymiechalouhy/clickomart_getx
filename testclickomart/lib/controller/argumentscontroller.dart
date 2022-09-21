import 'package:get/get.dart';

class ArgumentController extends GetxController {
  String? id;

  @override
  void onInit() {
    id = Get.arguments['id'];
    super.onInit();
  }
}
import 'package:get/get.dart';

class ArgumentController extends GetxController {
  String? id;
  String? name;
  String? image;
  String? discount;
  String? discountPrice;
  String? description;
  String? price;

  @override
  void onInit() {
    id = Get.arguments['id'];
    name = Get.arguments['name'];
    image = Get.arguments['image'];
    discount = Get.arguments['discount'];
    discountPrice = Get.arguments['discountPrice'];
    description = Get.arguments['description'];
    price = Get.arguments['price'];
    super.onInit();
  }
}

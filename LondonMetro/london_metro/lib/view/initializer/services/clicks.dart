import 'package:get/get.dart';

class ClickController extends GetxController {
  var clicks = 0.obs;

  void incrementClicks() {
    clicks++;
  }
}

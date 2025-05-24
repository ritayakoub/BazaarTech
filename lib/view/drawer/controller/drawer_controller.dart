import 'package:get/get.dart';

class DrawerControllerX extends GetxController {
  int selectedIndex = 0;

  void selectItem(int index) {
    selectedIndex = index;
    update();
  }
}

import 'dart:typed_data';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddItemController extends GetxController {
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);
  RxString imageName = "".obs;

  // Example function to set image
  void setImage(Uint8List bytes, String name) {
    imageBytes.value = bytes;
    imageName.value = name;
  }

  // Optionally reset image
  void clearImage() {
    imageBytes.value = null;
    imageName.value = "";
  }
}

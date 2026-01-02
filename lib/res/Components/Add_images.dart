import 'package:flutter/material.dart';
import 'package:food_app_adminpanel/Controllers/Add_item_controller.dart';
import 'package:food_app_adminpanel/View_Model/Add_new_item_VM.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:get/get.dart';

class AddImages extends StatelessWidget {
  final String value;
  AddImages({super.key, required this.value});

  final pickerPlugin = ImagePickerPlugin();
  final controller = Get.put(AddItemController());

  Future<void> pickWebImage() async {
    final image = await pickerPlugin.getImageFromSource(
      source: ImageSource.gallery,
    );

    if (image != null) {
      final bytes = await image.readAsBytes();
      controller.setImage(bytes, image.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Upload $value Image",
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: pickWebImage,
            child: Container(
              height: 250,
              width: 250,
              color: Colors.grey[200],
              child: Obx(() {
                if (controller.imageBytes.value != null) {
                  return Image.memory(
                    controller.imageBytes.value!,
                    fit: BoxFit.cover,
                  );
                } else {
                  return const Icon(Iconsax.camera, size: 50);
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}

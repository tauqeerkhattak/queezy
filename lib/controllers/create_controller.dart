import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:queezy/model/category_item.dart';

class CreateController extends GetxController {
  Rxn<XFile> image = Rxn<XFile>();
  final ImagePicker _picker = ImagePicker();
  Rxn<CategoryItem> selectedCategory = Rxn<CategoryItem>();

  void pickImage({required ImageSource source}) async {
    XFile? temp = await _picker.pickImage(source: source);
    if (temp != null) {
      image.value = temp;
    }
  }
}

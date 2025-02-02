import 'package:image_picker/image_picker.dart';

class ImagePickerHelper{
  static final ImagePicker _imagePicker = ImagePicker();

  static Future<XFile?> pickImage(ImageSource source)async{
    final XFile? image = await _imagePicker.pickImage(source: source);
    return image;
  }
}
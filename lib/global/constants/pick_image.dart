import 'package:image_picker/image_picker.dart';

Future<XFile?> selectImage() async {
  final imagePicker = ImagePicker();
  final pickedFile = await imagePicker.pickImage(
    source: ImageSource.gallery,
  );
  return pickedFile;
}

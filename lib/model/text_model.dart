import 'package:image_picker/image_picker.dart';

class TextModel {
  String scannedText;
  XFile? imageFile;

  TextModel({required this.scannedText, this.imageFile});
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:share_plus/share_plus.dart';
import 'package:snap_textify/res/app_color.dart';
import 'package:snap_textify/utils/utils.dart';
import 'package:snap_textify/widgets/custom_dialog.dart';
import 'package:snap_textify/widgets/loading_dialog.dart';

class TextViewModel with ChangeNotifier {
  bool textScanning = false;
  String scannedText = '';
  XFile? imageFile;
  bool isShowingLoadingDialog = false;

  Future<void> getImage(ImageSource source, BuildContext context) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        notifyListeners();
        await cropImage(pickedImage, context);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      showDialog(
          context: context,
          builder: (context) => const CustomDialog(
            title: 'Error',
            details: 'Error occured while Snap to Textify',
          )
      );
      _hideLoadingDialog(context);
      notifyListeners();
    }
  }

  Future<void> cropImage(XFile? imageFile, BuildContext context) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile!.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Edit Snap',
          toolbarColor: AppColor.primaryColor,
          toolbarWidgetColor: AppColor.onPrimaryColor,
          statusBarColor: AppColor.primaryColor,
          activeControlsWidgetColor: AppColor.primaryColor,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
      ],
    );
    if (croppedFile != null) {
      await getText(croppedFile, context);
    }
  }

  Future<void> getText(CroppedFile croppedFile, BuildContext context) async {
    _showLoadingDialog(context);
    final inputImage = InputImage.fromFilePath(croppedFile.path);
    final textRecognizer = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText =
    await textRecognizer.processImage(inputImage);
    await textRecognizer.close();
    scannedText = '';
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = '$scannedText${line.text}\n';
      }
    }
    textScanning = false;
    _hideLoadingDialog(context);
    if (scannedText.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const CustomDialog(
          title: 'No Text Found',
          details: 'No text found on Snap use another Snap to Textify',
        )
      );
    }
    notifyListeners();
  }

  void shareText() {
    Share.share(scannedText);
    notifyListeners();
  }

  void copyText() {
    Clipboard.setData(
      ClipboardData(
        text: scannedText,
      ),
    );
    Utils.toastMessage('Copied to Clipboard');
    notifyListeners();
  }

  void _showLoadingDialog(BuildContext context) {
    isShowingLoadingDialog = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => LoadingDialog(),
    );
  }

  void _hideLoadingDialog(BuildContext context) {
    isShowingLoadingDialog = false;
    Navigator.of(context).pop();
  }
}

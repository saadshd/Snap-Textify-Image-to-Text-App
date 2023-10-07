import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:snap_textify/utils/routes/routes_name.dart';
import 'package:snap_textify/view_model/text_view_model.dart';
import 'package:snap_textify/widgets/custom_app_bar.dart';
import 'package:snap_textify/widgets/rounded_button.dart';
import 'package:snap_textify/widgets/bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Snap Textify',
        actions: [
          Consumer<TextViewModel>(
            builder: (context, textViewModel, child) {
              return IconButton(
                onPressed: () {
                  showCustomBottomSheet(context);
                },
                icon: const Icon(Icons.more_vert),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select a Snap to Textify',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<TextViewModel>(
                  builder: (context, textViewModel, child) {
                    return RoundedButton(
                      icon: const Icon(Icons.camera_alt),
                      title: 'Camera',
                      size: 70,
                      height: 120,
                      width: 120,
                      onPress: () async {
                        await textViewModel.getImage(ImageSource.camera, context);
                        if (textViewModel.scannedText.isNotEmpty) {
                          Navigator.pushNamed(context, RoutesName.text);
                        }
                      },
                    );
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                Consumer<TextViewModel>(
                  builder: (context, textViewModel, child) {
                    return RoundedButton(
                      icon: const Icon(Icons.image),
                      title: 'Gallery',
                      size: 70,
                      height: 120,
                      width: 120,
                      onPress: () async {
                        await textViewModel.getImage(ImageSource.gallery, context);
                        if (textViewModel.scannedText.isNotEmpty) {
                          Navigator.pushNamed(context, RoutesName.text);
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

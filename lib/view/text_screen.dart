import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_textify/view_model/text_view_model.dart';
import 'package:snap_textify/widgets/custom_app_bar.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key, required String scannedText,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Result',
        actions: [
          Consumer<TextViewModel>(
            builder: (context, textViewModel, child) {
              return IconButton(
                onPressed: () {
                  textViewModel.copyText();
                },
                icon: const Icon(Icons.copy),
              );
            },
          ),
          Consumer<TextViewModel>(
            builder: (context, textViewModel, child) {
              return IconButton(
                onPressed: () {
                  textViewModel.shareText();
                },
                icon: const Icon(Icons.share),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Consumer<TextViewModel>(
                  builder: (context, textViewModel, child) {
                    return SelectableText(
                      textViewModel.scannedText,
                      showCursor: true,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

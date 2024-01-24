
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:snap_textify/view/save_screen/pdf.dart';
import 'package:snap_textify/view_model/text_view_model.dart';
import 'package:snap_textify/widgets/custom_app_bar.dart';

class TextScreen extends StatefulWidget {
   const TextScreen({super.key, required String scannedText, });

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
     final textViewModel = Provider.of<TextViewModel>(context, listen: false);

     _textEditingController = TextEditingController(text: textViewModel.scannedText);
  }
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
          Consumer<TextViewModel>(
            builder: (context, textViewModel, child) {
              return IconButton(
                onPressed: () async {
                  textViewModel.shareText();

                  await Printing.layoutPdf(onLayout: (format) => SavePdf().generatePdf(_textEditingController.text));

                },
                icon: const Icon(Icons.add_circle),
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
                    return TextField(
                      controller: _textEditingController,
                      maxLines: 20, // Set the maximum number of lines
                      keyboardType: TextInputType.multiline, // Set the keyboard type to multiline
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,

                        // labelText: 'Enter Text',
                        // hintText: 'Type your text here...',
                      ),
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

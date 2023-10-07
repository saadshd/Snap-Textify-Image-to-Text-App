import 'package:flutter/material.dart';
import 'package:snap_textify/widgets/custom_app_bar.dart';
import 'package:snap_textify/widgets/custom_expansion_tile.dart';
import 'package:snap_textify/widgets/section_title.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Help Center',
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          SectionTitle(title: 'Frequently Asked Questions'),
          CustomExpansionTile(
            question: 'How do I convert an image to text?',
            answer: 'To convert an image to text, follow these steps\n'
                '- Select an image using gallery or camera\n'
                '- Selected image will extract text and show it to you\n'
                '- You can copy and share the extracted text',
          ),
          CustomExpansionTile(
            question: 'Can I copy the extracted text?',
            answer: 'Yes, you can copy the extracted text',
          ),
          CustomExpansionTile(
            question: 'Can I share the extracted text?',
            answer: 'Yes, you can share the extracted text',
          ),
          CustomExpansionTile(
            question: 'Is there a limit to the number of images I can process?',
            answer: 'No, there is no set limit to the number of images you can process with Snap Textify. However, keep in mind that processing a large number of images may consume more device storage and processing time.',
          ),
          CustomExpansionTile(
            question: 'Can I convert handwritten text into digital text?',
            answer: 'Yes, Snap Textify can recognize both printed and handwritten text in images. Ensure that the handwriting is clear and legible for the best results.',
          ),
          CustomExpansionTile(
            question: 'Do I need an internet connection to use Snap Textify?',
            answer: 'No, Snap Textify can perform text recognition offline. You don\'t need an internet connection for the basic text conversion functionality.',
          ),
          CustomExpansionTile(
            question: 'How accurate is the text recognition?',
            answer: 'The accuracy of text recognition depends on the quality and clarity of the image. It generally performs well with clear, well-lit images. However, results may vary for handwritten or complex fonts. You can improve accuracy by capturing high-quality images.',
          ),

          SectionTitle(title: 'Troubleshooting'),
          CustomExpansionTile(
            question: 'No text found',
            answer: 'If no text is found in the image then ensure if there is any detectable text or not. Take a more accurate and clear snap.',
          ),
          CustomExpansionTile(
            question: 'Text recognition accuracy is low',
            answer: 'To improve accuracy, ensure that the image is well-lit and the text is clear. Avoid distorted or heavily stylized fonts. You can also try capturing the image from a different angle or adjusting the focus.',
          ),
          CustomExpansionTile(
            question: 'App crashes when processing images',
            answer: 'App crashes can occur due to various reasons, including insufficient device memory or conflicts with other apps. Ensure your device has enough available memory. If the issue persists, try closing other background apps or restarting your device.',
          ),
          CustomExpansionTile(
            question: 'Images are taking too long to process',
            answer: 'Processing times can vary depending on image size and complexity. To speed up processing, use smaller image sizes and avoid images with excessive detail. Also, ensure your device has sufficient processing power.',
          ),
          CustomExpansionTile(
            question: 'I can\'t access the camera or gallery',
            answer: 'If you can\'t access the camera or gallery, check your device settings to ensure the app has the necessary permissions. Go to device settings > App permissions and grant access to the camera and storage for Snap Textify.',
          ),
          CustomExpansionTile(
            question: 'The app is not responding',
            answer: 'If the app becomes unresponsive, try force-quitting the app and reopening it. You can also clear the app\'s cache and data from your device settings. If the problem persists, consider reinstalling the app.',
          ),
        ],
      ),
    );
  }
}



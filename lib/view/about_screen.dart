import 'package:flutter/material.dart';
import 'package:snap_textify/widgets/section_body.dart';
import 'package:snap_textify/widgets/custom_app_bar.dart';
import 'package:snap_textify/widgets/section_title.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'About'
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.document_scanner_rounded,
                      size: 100,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      'Snap Textify',
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Version: 1.0.0',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SectionBody(body: 'Snap Textify is a powerful image-to-text converter that allows you to extract text from images and documents effortlessly. Whether you need to digitize printed text, scan documents, or simply extract text from photos, Snap Textify has you covered.',),

              const SectionTitle(title: 'Features:'),
              const SectionBody(body: '- Image-to-text conversion',),
              const SectionBody(body: '- Text copying and sharing options',),

              const SectionTitle(title: 'Contact Us'),
              const SectionBody(body: 'We value your input and are here to help. If you have any questions, feedback, or need assistance, please contact us.',),

            ],
          ),
        ),
      ),
    );
  }
}

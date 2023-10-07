import 'package:flutter/material.dart';
import 'package:snap_textify/widgets/section_body.dart';
import 'package:snap_textify/widgets/custom_app_bar.dart';
import 'package:snap_textify/widgets/section_title.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Privacy Policy',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Last Updated: [Sep 21, 2023]',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 10),

              const SectionTitle(title: '1. Introduction'),
              const SectionBody(body: 'Welcome to Snap Textify! This Privacy Policy is designed to help you understand how we collect, use, disclose, and safeguard your personal information. By using our app, you agree to the practices described in this policy.',),

              const SectionTitle(title: '2. Information We Collect'),
              const SectionBody(body: 'We may collect various types of information, including:',),
              const SectionBody(body: '- Information you provide: When you use our app, you may provide us with certain information, such as images for text recognition.',),
              const SectionBody(body: '- Automatically collected information: We didn\'t collect any information automatically, like device information, usage data, and diagnostic information.',),

              const SectionTitle(title: '3. Contact Us'),
              const SectionBody(body: 'If you have any questions or concerns about our Privacy Policy, please contact us at [Email: saadrajput831@gmail.com].',),

              const SectionTitle(title: '4. Changes to This Privacy Policy'),
              const SectionBody(body: 'We may update our Privacy Policy from time to time. Any changes to this policy will be posted on this page, and the "Last Updated" date will be revised accordingly. Your continued use of our app after any changes will signify your acceptance of the updated Privacy Policy.',),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String details;

  const CustomDialog({super.key, required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(details),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

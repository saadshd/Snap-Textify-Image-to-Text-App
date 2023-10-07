import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final String question;
  final String answer;

  const CustomExpansionTile({Key? key, required this.question, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question,
        style: const TextStyle(
          fontWeight: FontWeight.w500
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(answer,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
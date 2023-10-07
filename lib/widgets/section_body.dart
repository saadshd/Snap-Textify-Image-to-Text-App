import 'package:flutter/material.dart';

class SectionBody extends StatelessWidget {
  final String body;

  const SectionBody({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        body,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Icon icon;
  final String title;
  final VoidCallback onPress;
  double? size;
  double? height;
  double? width;

  RoundedButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPress,
      this.size = 30.0,
      this.height = 60.0,
      this.width = 60.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: IconButton.filled(
            iconSize: size,
            onPressed: onPress,
            icon: icon,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}

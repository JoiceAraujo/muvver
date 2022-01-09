import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final String assetPath;

  const AvatarImage({Key? key, required this.assetPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(2)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(assetPath),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ClickableTexts extends StatelessWidget {
  const ClickableTexts({Key? key, required this.title, this.onClick})
      : super(key: key);
  final Widget title;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: onClick == null,
      child: InkWell(onTap: onClick ?? () {}, child: title),
    );
  }
}

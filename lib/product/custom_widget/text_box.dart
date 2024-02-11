import 'package:docdr/core/constant/static/style.dart';
import 'package:flutter/material.dart';

class QTextBox extends StatelessWidget {
  const QTextBox({
    super.key,
    required this.index,
    required this.makale,
    required this.width,
  });

  final int index;
  final List<String> makale;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ListTile(
        title: Text(
          makale[index],
          style: ProjectStyle.projectTextStyle,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}

class Style {
  static EdgeInsetsGeometry all8 = const EdgeInsets.all(8);
}

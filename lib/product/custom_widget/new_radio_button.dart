import 'package:docdr/core/constant/static/style.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  final String icerik;
  final int value;
  final int? isimsirasi;
  final void Function(int?) onChanged;

  const RadioButton({
    super.key,
    required this.icerik,
    required this.value,
    required this.isimsirasi,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          icerik,
          style: ProjectStyle.projectTextStyle,
        ),
        Radio(
          value: value,
          groupValue: isimsirasi,
          onChanged: onChanged,
        )
      ],
    );
  }
}

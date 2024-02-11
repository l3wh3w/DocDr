import 'package:docdr/core/constant/static/icon.dart';
import 'package:flutter/material.dart';

class WrapListesi extends StatefulWidget {
  const WrapListesi({
    super.key,
    required this.results,
    required this.removeResult,
    required this.sayfaIndex,
  });

  final List<double> results;
  final Function removeResult;
  final int sayfaIndex;

  @override
  State<WrapListesi> createState() => _WrapListesiState();
}

class _WrapListesiState extends State<WrapListesi> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: widget.results.asMap().entries.map((entry) {
        final index = entry.key;
        final result = entry.value;
        final formattedResult = result.toStringAsFixed(result.truncateToDouble() == result ? 1 : 2);

        final rowText = "${index + 1}-) $formattedResult";

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              rowText,
              style: const TextStyle(fontSize: 18),
            ),
            IconButton(
                icon: const Icon(MyFlutterApp.cancelcircle),
                color: Colors.blueGrey,
                onPressed: () => {
                      widget.removeResult(index, widget.results[index], widget.sayfaIndex),
                    }),
          ],
        );
      }).toList(),
    );
  }
}

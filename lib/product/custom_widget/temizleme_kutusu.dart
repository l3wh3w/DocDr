import 'package:docdr/product/custom_widget/provider.dart';
import 'package:flutter/material.dart';

class TemizlemeKutusu extends StatefulWidget {
  const TemizlemeKutusu({
    super.key,
    required this.temizle,
    required this.sayfaIndex,
  });
  final Function temizle;
  final int sayfaIndex;

  @override
  State<TemizlemeKutusu> createState() => _TemizlemeKutusuState();
}

class _TemizlemeKutusuState extends State<TemizlemeKutusu> {
  final HesaplamaProvider hesaplamaProvider = HesaplamaProvider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            widget.temizle(widget.sayfaIndex);
          });
        },
        child: const Text('Temizle'),
      ),
    );
  }
}

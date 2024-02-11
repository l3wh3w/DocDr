///
import 'package:flutter/widgets.dart';

class MyFlutterApp {
  MyFlutterApp._();

  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData cancelcircle = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData cancelcircle1 = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData okcircled = IconData(0xf06d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData help = IconData(0xf128, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData minuscircled = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

class MedalIcon extends StatelessWidget {
  const MedalIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/medal_tick.png",
      width: 40,
      height: 40,
    );
  }
}

import 'package:flutter/widgets.dart';

class MyCustomIcon {
  MyCustomIcon._();

  static const _kFontFam = 'MyIconFont';
  static const String? _kFontPkg = null;

  static const IconData g_nav1 = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData g_nav4 = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData g_nav2 = IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData g_nav3 = IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

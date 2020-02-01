import 'package:flutter/material.dart';

class FontStylesConsts {
  static const fontGoogle = 'Google';
  static const dashed = TextDecorationStyle.dashed;

  static const titleLogin =
      TextStyle(fontFamily: fontGoogle, fontSize: 32, color: Colors.white);

  static const titleLoginBold = TextStyle(
      fontFamily: fontGoogle,
      fontSize: 32,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static const titleLoginBoldUDS = TextStyle(
      fontFamily: fontGoogle,
      fontSize: 32,
      color: Colors.blue,
      fontWeight: FontWeight.bold);

  static const hintStyleLogin =
      TextStyle(fontFamily: fontGoogle, fontSize: 16, color: Colors.white);

  static const subTitileLogin =
      TextStyle(fontFamily: fontGoogle, fontSize: 26, color: Colors.white);

  static const labelsLogin = TextStyle(
    fontFamily: fontGoogle,
    fontSize: 16,
    color: Colors.white,
    decoration: TextDecoration.underline,
  );

  static const titleItemPauta = TextStyle(
      fontFamily: fontGoogle,
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static const descriptiontemPauta = TextStyle(
      fontFamily: fontGoogle,
      fontSize: 16,
      color: Colors.white);

  static const autorCardStyle = TextStyle(
      fontFamily: fontGoogle,
      fontSize: 16,
      color: Colors.blue);
}

import 'dart:ui';
import 'package:seeri/common/colors_common.dart';


const String fontFamily = 'Inter';

class SeeriTextStyles {
  SeeriTextStyles._();

  TextStyle heading({
    Color color = SeeriColors.white,
    FontWeight fontWeight = FontWeight.w600,
  }) => TextStyle(
    color: color,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    fontSize: 26.0,
  );

  TextStyle subTitle({
    Color color = SeeriColors.white,
    FontWeight fontWeight = FontWeight.w700,
  }) => TextStyle(
    color: color,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    fontSize: 16.0,
  );

  TextStyle paragraph({
    Color color = SeeriColors.white,
    FontWeight fontWeight = FontWeight.w500,
  }) => TextStyle(
    color: color,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    fontSize: 14.0,
  );
}
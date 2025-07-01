import 'package:flutter/material.dart';

abstract class AppColors{

  static const  mainColor = Color(0xff44B757);
  static const  secondary = Color(0xff64A76F);

  static const  secondColor = Color(0xffA1DBAB);
  static const  secondAccentColor = Color(0xffCFFFD7);




  static const  lightColor = Color(0xffFFFFFF);
  static const  darkColor = secondColor;

  static const textHintColor = Color(0xff9298A9);
  static const quizTextColor = Color(0xffA9A9A9);

  static const textFieldColor = Color(0xffEFEFEF);
  static const greyTextColor = Color(0xff979797);

  static const borderColor = Color(0xffFD9D9D9);

  static const showNumbersColors = Color(0xE5FFFFFF);


  static const hint = Color(0xFFA2A7B4);

  static const textColor = Color(0xFF3A3A3A);
  static const questionTextColor = Color(0xFF3C3A36);

  static const secondaryTextColor = Color(0xFF010F07);
  static const redTextColor = Color(0xffBB131A);
  static const preButtonColor = Color(0xff7B7B7B);

  static const whiteColor = Color(0xffFFFFFF);

  static const blackColor = Color(0xff001B29);
  static const background = Color(0xffF8F8F8);

  static const grayColor = Color(0xff878787);
  static const darkGrayColor = Color(0xff6E6E6E);
  static const borderColors = Color(0xff6A6A6A);

  static const grayLightColor = Color(0xffDCDCDC);
  static const navInColor = Color(0xFF8891A5);


  static const successColor = Color(0xff76C37C);

  static const warningColor = Color(0xffCE8C4B);
  static const errorColor = Color(0xffC74438);
  static const colorPlaceHolder = Color(0xffC4C4C4);
  static const bordersColor = Color(0xffF5F7FA);

  static const green = Color(0xFF28AE0F);

  static const photoCover = Color(0xffCCCCCC);

  static const yellow= Color(0xffFCCC23);



  static Color getColorFromHex(String? hexColor) {
    if (hexColor == null) {
      return Colors.transparent;
    }
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "0xFF$hexColor";
    }
    return Color(int.parse(hexColor));
  }


}

const KSecondaryColor =Color(0xFFFE6DBE);
const KTextColor =Color(0xFF12153D);
const KTextLightColor =Color(0xFF9A9BB2);
const KFillStartColor =Color(0xFFFCC419);


const defaultBlueColor= Color(0xFF0A1057);
const defaultDarkColor=Colors.blueGrey;





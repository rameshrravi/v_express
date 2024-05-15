

// bool firstTime = true;

// TextStyle buttonText1(BuildContext context) =>
//     Theme.of(context).textTheme.caption!.copyWith(
//         color: const Color(0xffffffff),
//         fontWeight: FontWeight.w400,
//         fontFamily: ImageConstants.FontFamily,
//         fontStyle: FontStyle.normal,
//         fontSize: 15.0);

// class ThemeUtils {
//   static final ThemeData defaultAppThemeData = appTheme("");
//   static const TextStyle buttonText1 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 15.0);
//   static const TextStyle appBarTitleTextv2 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       letterSpacing: 0.5,
//       fontSize: 15.0);
//   static const TextStyle buttonText2 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 20.0);
//   static const TextStyle bodyText1 = TextStyle(
//       color: Color(0xff000000),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 20.0);
//   static const TextStyle titleText1 = TextStyle(
//       color: Color(0xff000000),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 15.0);
//   static const TextStyle buttonText3 = TextStyle(
//       color: Color(0xff000000),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 15.0);
//   static const TextStyle buttonText4 = TextStyle(
//       color: Color(0xff000000),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 15.0);
//   static const TextStyle appBarTitleText1 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 25.0);

//   /// this below font is used for app bar text*/
//   static const TextStyle appBarTitleText2 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w600,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       letterSpacing: 0.15,
//       fontSize: 20.0);
//   static const TextStyle labelText1 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w500,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 13.0);
//   static const TextStyle hintText1 = TextStyle(
//       color: Color(0x8050585d),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle appBarTitleText3 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 15.0);
//   static const TextStyle labelText2 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 13.0);
//   static const TextStyle buttonText5 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 10.0);
//   static const TextStyle hintText2 = TextStyle(
//       color: Color(0x8050585d),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle bodyText2 = TextStyle(
//       color: Color(0xff50585d),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle bodyText3 = TextStyle(
//       color: Color(0xff50585d),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 11.0);
//   static const TextStyle hintText3 = TextStyle(
//       color: Color(0xff707070),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle bodyText4 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 9.0);
//   static const TextStyle bodyText5 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 10.0);
//   static const TextStyle bodyText6 = TextStyle(
//       color: Color(0xff039717),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 16.0);
//   static const TextStyle bodyText7 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle bodyText8 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);
//   static const TextStyle bodyText9 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);
//   static const TextStyle hintText4 = TextStyle(
//       color: Color(0xff585656),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 15.0);
//   static const TextStyle bodyText10 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 20.0);
//   static const TextStyle bodyText11 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 18.0);
//   static const TextStyle bodyText12 = TextStyle(
//       color: Color(0xff707070),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);
//   static const TextStyle bodyText13 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 9.0);
//   static const TextStyle appBarTitleText4 = TextStyle(
//       color: Color(0xff000000),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 18.0);
//   static const TextStyle bodyText14 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle hintText5 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle bodyText15 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);
//   static const TextStyle bodyText16 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 10.0);
//   static const TextStyle bodyText17 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w400,
//       letterSpacing: 0.25,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle bodyText18 = TextStyle(
//       color: Color(0xff000000),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       letterSpacing: 0.25,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle bodyText19 = TextStyle(
//       color: Color(0xff000000),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 6.0);
//   static const TextStyle bodyText20 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 16.0);
//   static const TextStyle buttonText6 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle bodyText21 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 25.0);
//   static const TextStyle bodyText22 = TextStyle(
//       color: Color(0xffeb1c23),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 10.0);
//   static const TextStyle bodyText23 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);

//   /// the below font is used for tabs */
//   static const TextStyle bodyText24 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       letterSpacing: 0.1,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle bodyText47 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       letterSpacing: 0.1,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);

//   /// Used for subject to be displayed in dashboard */
//   static const TextStyle bodyText25 = TextStyle(
//       color: Color(0xff000000),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       letterSpacing: 0.25,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle bodyText26 = TextStyle(
//       color: Color(0xff000000),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       letterSpacing: 0.4,
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);
//   static const TextStyle bodyText27 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       letterSpacing: 0.25,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);

//   // ignore: constant_identifier_names
//   static const TextStyle textSize_13_normal = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       letterSpacing: 0.25,
//       fontStyle: FontStyle.normal,
//       fontSize: 13.0);

//   /// used for siaplaying refrence style is like */
//   static const TextStyle bodyText48 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       letterSpacing: 0.25,
//       fontStyle: FontStyle.normal,
//       fontSize: 16.0);
//   static const TextStyle bodyText28 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 15.0);
//   static const TextStyle bodyText29 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       letterSpacing: 0.25,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle bodyText30 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 11.0);
//   static const TextStyle bodyText31 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 16.0);
//   static const TextStyle appbarTitle = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 20.0);
//   static const TextStyle bodyText32 = TextStyle(
//       color: Color(0xffff0000),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 10.0);
//   static const TextStyle bodyText33 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 16.0);
//   static const TextStyle bodyText34 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 15.0);
//   static const TextStyle bodyText35 = TextStyle(
//       color: Color(0xffff0009),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);
//   static const TextStyle bodyText36 = TextStyle(
//       color: Color(0xffff0009),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);
//   static const TextStyle bodyText37 = TextStyle(
//       color: Color(0xffff0009),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 16.0);
//   static const TextStyle appBarTitleText5 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 20.0);
//   static const TextStyle bodyText38 = TextStyle(
//       color: Color(0xff000000),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);
//   static const TextStyle bodyKDirectorySearchResult = TextStyle(
//       color: Color(0xff000000),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 11.0);
//   static const TextStyle bodyKDirectorySearchResult2 = TextStyle(
//       color: Colors.black87,
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 11.0);
//   static const TextStyle bodyText39 = TextStyle(
//       color: Color(0xff000000),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 15.0);
//   static const TextStyle bodyText40 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle bodyText41 = TextStyle(
//       color: Color(0xff05aba0),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 10.0);
//   static const TextStyle bodyText42 = TextStyle(
//       color: Color(0xff036b07),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 10.0);
//   static const TextStyle bodyText43 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 10.0);
//   static const TextStyle hintText6 = TextStyle(
//       color: Color(0xff707070),
//       fontWeight: FontWeight.w300,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 10.0);
//   static const TextStyle bodyText44 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w400,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);
//   static const TextStyle bodyText46 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 20.0);
//   static const TextStyle bodyText50 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 15.0);
//   static const TextStyle bodyText200 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 16.0);
//   static const TextStyle bodyText49 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 16.0);
//   static const TextStyle bodyText45 = TextStyle(
//       color: Color(0xffffffff),
//       fontWeight: FontWeight.w700,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 14.0);
//   static const TextStyle bodyText51 = TextStyle(
//       color: Color(0xff3d87f8),
//       fontWeight: FontWeight.w600,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 10.0);
//   static const TextStyle bodyText52 = TextStyle(
//       color: Color(0xff3d87f8),
//       fontWeight: FontWeight.w500,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);
//   static TextStyle bodyText52straikeline = TextStyle(
//       color: Color(0xff3d87f8),
//       fontWeight: FontWeight.w500,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       decoration: TextDecoration.combine([TextDecoration.lineThrough]),
//       fontSize: 10.0);
//   static const TextStyle bodyText53 = TextStyle(
//       color: Color(0xff154998),
//       fontWeight: FontWeight.w500,
//       fontFamily: ImageConstants.FontFamily,
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);

//   static const Color buttonColorBlue = Color(0xff154998);
//   static const Color buttonColorWhite = Color(0xffffffff);
//   static const Color borderButtonColorWhite = Color(0xff707070);
//   static const Color bgContainerGray = Color(0xfff1f1f1);
//   static const Color bgButtonGrey = Colors.grey;
//   static const Color childAppBarBlue = Color(0xff3d87f8);
//   static const Color borderBgContainerGreen = Color(0xff039717);
//   static const Color bgContainerHalfBlue = Color(0x1a154998);
//   static const Color bgBottomNavigationBarBlue = Color(0x40154998);
//   static const Color bgContainerGreen = Color(0xff0a6706);
//   static const Color bgContainerOrange = Color(0xffff7700);
//   static const Color bgContainerGrayTwo = Color(0xffc4d1e5);
//   static const Color borderBgContainerRed = Color(0xffff0009);
//   static const Color borderBgContainerGreenTwo = Color(0xff036b07);
//   static const Color bgContainerBlue = Color(0xbf154998);
//   static const Color appbarmedium = Color(0xff2630A8);
//   static const Color appbarlight = Color(0xff1C84DC);
//   static const Color appbardark = Color(0xff2630A8);
//   static const Color backgrounddark = Color(0xff012864);

//   static const Color babyblue = Color(0xffe6f3ff);
//   static const Color babywhite = Color(0xffffffff);
//   static const Color lightblue = Color(0xF17583AD);
//   static ThemeData appTheme(String a) {
//     return ThemeData(
//         brightness: Brightness.light,
//         primaryColor: Colors.green,
//         primarySwatch: Colors.green,
//         textTheme: const TextTheme());
//   }

//   static ThemeData themeData(
//       bool isDarkTheme, int index, BuildContext context) {
//     return ThemeData(
//         scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
//         primarySwatch: getColor(index) as MaterialColor,
//         primaryColor: isDarkTheme ? Colors.black : Colors.grey.shade300,
//         backgroundColor: isDarkTheme ? Colors.grey.shade700 : Colors.white,
//         indicatorColor:
//             isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
//         hintColor: isDarkTheme ? Colors.grey.shade300 : Colors.grey.shade800,
//         highlightColor:
//             isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
//         hoverColor:
//             isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
//         focusColor:
//             isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
//         disabledColor: Colors.grey,
//         cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
//         canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
//         brightness: isDarkTheme ? Brightness.dark : Brightness.light,
//         buttonTheme: Theme.of(context).buttonTheme.copyWith(
//             colorScheme: isDarkTheme
//                 ? const ColorScheme.dark()
//                 : const ColorScheme.light()),
//         appBarTheme: const AppBarTheme(
//           elevation: 0.0,
//         ),
//         textTheme: TextTheme(
//             /*    headline2: TextStyle(fontSize: 8.0),
//           bodyText2: textFontStyle("small",15),*/

//             ));
//   }

//   static TextStyle textFontStyle(String status, double size) {
//     TextStyle textFontSize;
//     textFontSize = const TextStyle(
//         color: Color(0xff154998),
//         fontWeight: FontWeight.w400,
//         fontFamily: ImageConstants.FontFamily,
//         fontStyle: FontStyle.normal,
//         fontSize: 15.0);
//     if (status == "small") {
//       textFontSize = TextStyle(
//           color: Color(0xff154998),
//           fontWeight: FontWeight.w400,
//           fontFamily: ImageConstants.FontFamily,
//           fontStyle: FontStyle.normal,
//           fontSize: size);
//     } else if (status == "large") {
//       textFontSize = TextStyle(
//           color: Color(0xff154998),
//           fontWeight: FontWeight.w400,
//           fontFamily: ImageConstants.FontFamily,
//           fontStyle: FontStyle.normal,
//           fontSize: size);
//     }

//     return textFontSize;
//   }

//   static TextStyle textStyle(bool status) {
//     TextStyle buttonText1;
//     if (status) {
//       buttonText1 = const TextStyle(
//           color: Color(0xffffffff),
//           fontWeight: FontWeight.w400,
//           fontFamily: ImageConstants.FontFamily,
//           fontStyle: FontStyle.normal,
//           fontSize: 15.0);
//     } else {
//       buttonText1 = const TextStyle(
//           color: Color(0xff000000),
//           fontWeight: FontWeight.w700,
//           fontFamily: ImageConstants.FontFamily,
//           fontStyle: FontStyle.normal,
//           fontSize: 15.0);
//     }
//     return buttonText1;
//   }

//   static Color getColor(int index) {
//     switch (index) {
//       case 0:
//         return Colors.blueGrey;
//       case 1:
//         return Colors.blue;
//       case 2:
//         return Colors.red;
//       case 3:
//         return Colors.purple;
//       case 4:
//         return Colors.amber;
//       case 5:
//         return Colors.green;
//       case 6:
//         return Colors.yellow;
//       case 7:
//         return Colors.orange;
//       case 8:
//         return Colors.brown;
//       case 9:
//         return Colors.cyan;
//       case 10:
//         return Colors.lime;
//     }
//     return Colors.purple;
//   }
// }

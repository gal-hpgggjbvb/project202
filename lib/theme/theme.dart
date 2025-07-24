import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Satoshi",

  primaryColor: Colors.orange,
  primaryColorLight: Colors.white,
  primaryColorDark: Colors.black,

  scaffoldBackgroundColor: const Color(0xFFFDF8F3),

  //todo appBar
  appBarTheme: const AppBarTheme(
    color: Color(0xFFFDF8F3),
    // color: Colors.orange,
  ),

  //todo tabBar
  // tabBarTheme: TabBarTheme(
  //   labelColor: Colors.black,
  //   labelStyle: const TextStyle(
  //     fontFamily: "Satoshi",
  //     fontSize: 15,
  //     fontWeight: FontWeight.w700, // typing style
  //   ),
  //   unselectedLabelColor: Colors.grey.shade700,
  //   indicatorSize: TabBarIndicatorSize.tab,
  //   indicatorColor: Colors.deepOrange,
  //   // indicator: UnderlineTabIndicator(
  //   //   borderSide: BorderSide(width: 3.0, color: Colors.orange),
  //   // ),
  //   //todo another indicator theme
  //   // indicator: BoxDecoration(
  //   //   borderRadius: BorderRadius.circular(50),
  //   //   color: Colors.orange.withOpacity(0.2),
  //   // ),
  //
  //   // labelPadding: EdgeInsets.symmetric(horizontal: 5),
  // ),

  //todo colorScheme
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade500,
    onBackground: Colors.orangeAccent,
    primary: Colors.black,
    // onPrimary: const Color(0xFFFDF8F3),
    onPrimary: Colors.green,
    secondary: Colors.white,
    onSecondary: Colors.black,
  ),

  //todo floating
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blue.shade300,
    foregroundColor: Colors.amber,
  ),

  // textTheme: const TextTheme(
  //   bodyLarge: TextStyle(
  //     color: Colors.orange,
  //     fontSize: 20,
  //     fontWeight: FontWeight.bold,
  //     fontFamily: "Satoshi",
  //   ),
  //   // bodyMedium: TextStyle(),
  // ),

  //todo textStyle
  textTheme: ThemeData.light()
      .textTheme
      .apply(
        fontFamily: 'Satoshi',
        bodyColor: Colors.black, // Default text color
        displayColor: Colors.black87, // For headings and titles
      )
      .copyWith(
        bodyLarge: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
          fontFamily: 'Satoshi',
        ),
        //order field & listtile title
        bodyMedium: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontFamily: 'Satoshi',
        ),
        //expansionTile
        bodySmall: const TextStyle(
          fontFamily: "Satoshi",
          color: Colors.black,
          fontSize: 17,
        ),
        //expansion listTile buttons
        displaySmall: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontFamily: 'Satoshi',
        ),
        titleLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontFamily: 'Satoshi',
        ),
      ),

  //todo divider
  dividerTheme: const DividerThemeData(
    thickness: 0.2,
    color: Colors.black,
  ),

  // todo inputField decoration

  // inputDecorationTheme: const InputDecorationTheme(
  //   filled: true,
  //   fillColor: Color(0xFFF6F6F6),
  //   labelStyle: TextStyle(
  //     color: Colors.orangeAccent,
  //     fontSize: 15,
  //     fontWeight: FontWeight.normal,
  //     fontFamily: "Satoshi",
  //   ),
  //   hintStyle: TextStyle(color: Colors.grey),
  //   contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
  //   border: OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.orangeAccent),
  //     borderRadius: BorderRadius.all(Radius.circular(25)),
  //   ),
  //   focusedBorder: OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.orangeAccent),
  //     borderRadius: BorderRadius.all(Radius.circular(25)),
  //   ),
  //   enabledBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(25)),
  //     borderSide: BorderSide(color: Colors.grey),
  //   ),
  //   // errorBorder: OutlineInputBorder(
  //   //   borderRadius: BorderRadius.all(Radius.circular(12)),
  //   //   borderSide: BorderSide(color: Colors.red),
  //   // ),
  // ),

  //todo expansionTile
  expansionTileTheme: ExpansionTileThemeData(
    collapsedBackgroundColor: Colors.orange.shade300,
    backgroundColor: Colors.deepOrange.shade50,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    collapsedShape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
  ),

  //todo listTile
  listTileTheme: ListTileThemeData(
      // style: ListTileStyle(),

      ),

  //todo elevated button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
      elevation: 10,
      shadowColor: Colors.deepOrange,

      // fixedSize: const Size(400, 100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      // textStyle: const TextStyle(
      //   fontSize: 16,
      //   fontWeight: FontWeight.bold,
      // ),
    ),
  ),

  // todo textButton
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.orange),
      // Text color
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.orange.withOpacity(0.1); // Splash color
          }
          return null;
        },
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
  ),

  //todo material button
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.light(
      background: Colors.orange,
      onBackground: Colors.deepOrange,
      primary: Colors.orange.shade300,
      secondary: Colors.orange.shade500,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    splashColor: Colors.deepOrange,
    height: 100,
    minWidth: double.infinity,
  ),

  //todo bottomsheet
  //   bottomSheetTheme:  const BottomSheetThemeData(
  //     backgroundColor: Colors.white,
  //     // showDragHandle: true,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     elevation: 10,
  //   ),

  //todo listTile
);
//todo dark theme ***********************************************************
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: "Satoshi",

  ///hidden appbar
  primaryColor: Colors.orange,

  ///hidden background
  primaryColorLight: const Color(0xFF3b3f43),

  ///make order title bottomsheet
  primaryColorDark: Colors.orange,

  ///scaffold
  scaffoldBackgroundColor: const Color(0xFF262D30),

  ///maybe
  // scaffoldBackgroundColor: const Color(0xFF121212),
  // scaffoldBackgroundColor: const Color(0xFF0A0E21),
  // scaffoldBackgroundColor: const Color(0xFF1C2230),
  // scaffoldBackgroundColor: const Color(0xFF3b3f43),
  // scaffoldBackgroundColor: const Color(0xFF333333),
  // scaffoldBackgroundColor: const Color(0xFF464646),

  //todo appbar
  appBarTheme: const AppBarTheme(
    // color: Color(0xFF1C2230),
    color: Color(0xFF262D30),
  ),

  //todo tabBar
  tabBarTheme: TabBarTheme(
    labelColor: Colors.orange,
    labelStyle: const TextStyle(
      fontFamily: "Satoshi",
      fontSize: 15,
      fontWeight: FontWeight.w700, // typing style
    ),
    unselectedLabelColor: Colors.orange.shade300,
    indicatorSize: TabBarIndicatorSize.tab,
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(width: 3.0, color: Colors.orange),
    ),
    //todo another indicator theme
    // indicator: BoxDecoration(
    //   borderRadius: BorderRadius.circular(50),
    //   color: Colors.orange.withOpacity(0.2),
    // ),

    // labelPadding: EdgeInsets.symmetric(horizontal: 5),
    indicatorColor: Colors.deepOrange,
  ),

  //todo colorScheme
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,

    ///hint text
    background: Colors.grey.shade300,
    // onBackground: Color(0x2F313DFF),
    ///mini buttons
    onBackground: Colors.orangeAccent,

    ///expansion listtile
    primary: Colors.black,

    ///fields fill
    onPrimary: const Color(0xFF464646),

    ///mini button text
    secondary: Colors.black,

    ///used
    onSecondary: Colors.white,
  ),

  //todo floating
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.black54,
    foregroundColor: Colors.white,
  ),

  //todo text theme
  textTheme: ThemeData.dark()
      .textTheme
      .apply(
        fontFamily: 'Satoshi',
        bodyColor: Colors.black, // Default text color
        displayColor: Colors.black87, // For headings and titles
      )
      .copyWith(
        bodyLarge: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
          fontFamily: 'Satoshi',
        ),
        bodyMedium: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontFamily: 'Satoshi',
        ),
        bodySmall: const TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontFamily: "Satoshi",
        ),
        //expansion listTile buttons
        displaySmall: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontFamily: 'Satoshi',
        ),
        titleLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontFamily: 'Satoshi',
        ),
      ),

  //todo divider
  dividerTheme: const DividerThemeData(
    thickness: 0.2,
    color: Colors.white,
  ),

  // todo inputField decoration
  // inputDecorationTheme: InputDecorationTheme(
  //   filled: true,
  //   fillColor: Color(0xFFF6F6F6),
  //   labelStyle: TextStyle(
  //     color: Colors.red.shade300,
  //     fontSize: 15,
  //     fontWeight: FontWeight.normal,
  //     fontFamily: "Satoshi",
  //   ),
  //   hintStyle: TextStyle(color: Colors.grey),
  //   contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
  //   border: OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.red.shade300),
  //     borderRadius: BorderRadius.all(Radius.circular(25)),
  //   ),
  //   focusedBorder: OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.red.shade300),
  //     borderRadius: BorderRadius.all(Radius.circular(25)),
  //   ),
  //   enabledBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(25)),
  //     borderSide: BorderSide(color: Colors.grey),
  //   ),
  //   // errorBorder: OutlineInputBorder(
  //   //   borderRadius: BorderRadius.all(Radius.circular(12)),
  //   //   borderSide: BorderSide(color: Colors.red),
  //   // ),
  // ),

  //todo expansionTile
  expansionTileTheme: ExpansionTileThemeData(
    collapsedBackgroundColor: Colors.orange.shade400,
    backgroundColor: Colors.deepOrange.shade100,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    collapsedShape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
  ),

  //todo material button
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.dark(
      background: Colors.orange,
      onBackground: Colors.deepOrange,
      primary: Colors.orange.shade300,
      secondary: Colors.orange.shade500,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    splashColor: Colors.deepOrange,
    height: 100,
    minWidth: double.infinity,
  ),
);

/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
import 'package:flutter/material.dart';
import 'package:general_lib/general_lib.dart';
import 'package:general_lib_flutter/widget/widget.dart';
import 'package:documentation/documentation_core.dart';
import 'package:simulate/simulate.dart';
import 'documentation_data.dart';

// ignore: non_constant_identifier_names
void documentation_main_app(List<String> arguments) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Simulate.ensureInitialized();
  runApp(const DocumentationMainApp());
}

class DocumentationMainApp extends StatelessWidget {
  static GeneralLibFlutterApp generalLibFlutterApp = GeneralLibFlutterApp();
  const DocumentationMainApp({super.key});

  ThemeData lightTheme_default() {
    final ThemeData themeData = ThemeData.light();
    return themeData.copyWith(
      // primaryColor: themeData.scaffoldBackgroundColor,
      shadowColor: const Color.fromARGB(110, 0, 0, 0),
      // textTheme: const TextTheme(
      //   labelMedium: TextStyle(
      //     color: Colors.black,
      //     fontSize: 18.0,
      //     fontWeight: FontWeight.w500,
      //   ),
      //   labelSmall: TextStyle(
      //     color: Colors.black,
      //     fontSize: 14.0,
      //     fontWeight: FontWeight.w500,
      //   ),
      // ),
      //
      textTheme: Typography().black.apply(
            fontFamily: "Poppins",
            package: "general_lib_assets_flutter",
          ),
      indicatorColor: Colors.black,
      dialogBackgroundColor: Colors.white,
      cardColor: Colors.grey,
      colorScheme: const ColorScheme.light().copyWith(
        primary: Colors.black,
        secondary: Colors.white,
      ),
      highlightColor: Colors.indigo,
    );
  }

  ThemeData darkTheme_default() {
    final ThemeData themeData = ThemeData.dark();
    return themeData.copyWith(
      // primaryColor: themeData.scaffoldBackgroundColor,
      scaffoldBackgroundColor: Colors.black,
      // textTheme: const TextTheme(
      //   labelMedium: TextStyle(
      //     color: Colors.white,
      //     fontSize: 18.0,
      //     fontWeight: FontWeight.w400,
      //   ),
      //   labelSmall: TextStyle(
      //     color: Colors.white,
      //     fontSize: 14.0,
      //     fontWeight: FontWeight.w400,
      //   ),
      // ),
      textTheme: Typography().white.apply(
            fontFamily: "Poppins",
            package: "general_lib_assets_flutter",
          ),
      indicatorColor: Colors.white,
      dialogBackgroundColor: const Color.fromARGB(255, 64, 64, 64),
      cardColor: Colors.grey,
      shadowColor: const Color.fromARGB(255, 24, 4, 83),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: const Color.fromARGB(255, 64, 64, 64),
      ),
      highlightColor: Colors.cyan,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GeneralLibFlutterAppMain(
      generalLibFlutterApp: generalLibFlutterApp,
      lightTheme: (context, defaultTheme) {
        return lightTheme_default();
      },
      darkTheme: (context, defaultTheme) {
        return darkTheme_default();
      },
      builder: (themeMode, lightTheme, darkTheme, widget) {
        final Widget child = MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          home: DocumentationApp(
            generalLibFlutterApp: generalLibFlutterApp,
            documentationData: documentationData,
          ),
        );

        if (Dart.isDebug) {
          if (Dart.isDesktop && Dart.isWeb == false) {
            return MaterialApp(
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeMode,
              debugShowCheckedModeBanner: false,
              home: SimulateApp(
                generalLibFlutterApp: generalLibFlutterApp,
                home: child,
              ),
            );
          }
        }

        return child;
      },
    );
  }
}

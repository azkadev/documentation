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
import 'package:documentation/scheme/scheme.dart';
import 'package:flutter/material.dart';

import 'package:documentation/page/landing/landing.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';

class DocumentationApp extends StatefulWidget {
  final DocumentationData documentationData;
  final GeneralLibFlutterApp generalLibFlutterApp;
  const DocumentationApp({
    super.key,
    required this.documentationData,
    required this.generalLibFlutterApp,
  });

  @override
  State<DocumentationApp> createState() => _DocumentationAppState();
}

class _DocumentationAppState extends State<DocumentationApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      navigate();
    });
  }

  void navigate() async {
    setState(() {});

    Future(() async {
      await Future.delayed(Durations.extralong4);
      // ignore: use_build_context_synchronously
      context.navigator().push(MaterialPageRoute(
        builder: (context) {
          return LandingPageDocumentation(
            documentationData: widget.documentationData,
            generalLibFlutterApp: widget.generalLibFlutterApp,
          );
        },
      ));
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

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
// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';

class ListWithDocumentationWidget extends StatefulWidget {
  final Axis direction;
  final bool isShowTitle;
  final String title;
  final Widget Function(BuildContext context, int index) builder;
  final int itemCount;
  final List<String> authorUrlSocialMedias;
  const ListWithDocumentationWidget({
    super.key,
    this.direction = Axis.horizontal,
    this.isShowTitle = true,
    this.title = "Author / Created By",
    required this.authorUrlSocialMedias,
    required this.itemCount,
    required this.builder,
  });

  @override
  State<ListWithDocumentationWidget> createState() => _ListWithDocumentationWidgetState();
}

class _ListWithDocumentationWidgetState extends State<ListWithDocumentationWidget> {
  @override
  Widget build(BuildContext context) {
    return sponsorsWidget();
  }

  double runSpacing = 4;
  double spacing = 4;
  int listSize = 15;
  int columns = 4;

  Widget sponsorsWidget() {
    List<String> links = widget.authorUrlSocialMedias;
    links.sort();
    return Column(
      children: [
        Visibility(
          visible: widget.isShowTitle,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Builder(
              builder: (context) {
                TextStyle textStyle = TextStyle(
                  color: context.theme.indicatorColor,
                  fontFamily: "MochiyPopOne",
                  fontSize: context.height / 67,
                  shadows: [
                    BoxShadow(
                      color: context.theme.shadowColor.withAlpha(110),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                    BoxShadow(
                      color: context.theme.shadowColor.withAlpha(110),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                );
                return Stack(
                  children: List.generate(
                    2,
                    (index) {
                      return Text(
                        "${widget.title}".trim(),
                        style: (index == 0)
                            ? textStyle.copyWith(
                                color: null,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 6
                                  ..color = context.theme.canvasColor,
                              )
                            : textStyle,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            removeLeft: true,
            removeRight: true,
            removeTop: true,
            child: Wrap(
              runSpacing: runSpacing,
              spacing: spacing,
              alignment: WrapAlignment.center,

              direction: widget.direction,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.itemCount,
                (index) {
                  return widget.builder(
                    context,
                    index,
                  );
                  // String link = links[index];
                  // AccountData accountData = accountDatas[index];
                  // return MaterialButton(
                  //   onPressed: () async {
                  //     await launchUrlString(
                  //       link,
                  //       mode: LaunchMode.externalApplication,
                  //     ).general_lib_execute_or_null(
                  //       isThrowOnError: false,
                  //     );
                  //   },
                  //   child: sponsowrWidget(
                  //     link: link,
                  //   ),
                  // );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

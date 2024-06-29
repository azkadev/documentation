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
// ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'package:documentation/scheme/account_data.dart';

import 'profile_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_lib/general_lib.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';

class SponsorDocumentationWidget extends StatefulWidget {
  final List<AccountData> sponsor;
  const SponsorDocumentationWidget({super.key, required this.sponsor});

  @override
  State<SponsorDocumentationWidget> createState() => _SponsorDocumentationWidgetState();
}

class _SponsorDocumentationWidgetState extends State<SponsorDocumentationWidget> {
  @override
  Widget build(BuildContext context) {
    return sponsorsWidget();
  }

  double runSpacing = 4;
  double spacing = 4;
  int listSize = 15;
  int columns = 4;

  Widget sponsorsWidget() {
    List<AccountData> accountDatas = widget.sponsor;

    return Visibility(
      visible: accountDatas.isNotEmpty,
      child: Column(
        children: [
          Padding(
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
                        "Sponsored / Powered By".trim(),
                        style: (index == 0)
                            ? textStyle.copyWith(
                                color: null,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 6
                                  ..color = Colors.black,
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

                // mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  accountDatas.length,
                  (index) {
                    AccountData accountData = accountDatas[index];
                    return sponsowrWidget(
                      accountData: accountData,
                      onPressed: () {},
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sponsowrWidget({
    // required BuildContext context,
    IconData defaultIconData = CupertinoIcons.globe,
    required AccountData accountData,
    required void Function()? onPressed,
  }) {
    String value_data =
        ("${(accountData.first_name ?? "").trim()} ${(accountData.last_name ?? "").trim()}")
            .trim();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: ProfilePictureDocumentationWidget(
              pathImage: accountData.profile_picture ?? "",
              nick_name: "${value_data}".trim().toUpperCaseFirstData(),
              height: context.height / 30,
              width: context.height / 30,
              borderRadius:
                  BorderRadius.all(Radius.circular(context.height / 70)),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Builder(
            builder: (context) {
              TextStyle textStyle = TextStyle(
                color: context.theme.indicatorColor,
                fontFamily: "MochiyPopOne",
                fontSize: (context.height / 90),
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
                      value_data,
                      style: (index == 0)
                          ? textStyle.copyWith(
                              color: null,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = Colors.black,
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
        ],
      ),
    );
  }
}

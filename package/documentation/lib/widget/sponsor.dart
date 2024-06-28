 // ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps, non_constant_identifier_names

 import 'package:documentation/scheme/account_data.dart';

import 'profile_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_lib/general_lib.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';

class SponsorWidget extends StatefulWidget {
  final List<AccountData> sponsor;
  const SponsorWidget({super.key, required this.sponsor});

  @override
  State<SponsorWidget> createState() => _SponsorWidgetState();
}

class _SponsorWidgetState extends State<SponsorWidget> {
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
    String value_data = ("${(accountData.first_name ?? "").trim()} ${(accountData.last_name ?? "").trim()}").trim();

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
            child: ProfilePicture(
              pathImage: accountData.profile_picture ?? "",
              nick_name: "${value_data}".trim().toUpperCaseFirstData(),
              height: context.height / 30,
              width: context.height / 30,
              borderRadius: BorderRadius.all(Radius.circular(context.height / 70)),
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

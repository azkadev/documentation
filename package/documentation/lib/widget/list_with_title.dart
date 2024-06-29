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

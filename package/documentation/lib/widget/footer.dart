// ignore_for_file: non_constant_identifier_names

import 'package:documentation/scheme/documentation_footer_data.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:flutter/material.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:documentation/scheme/footer_data.dart';
import 'package:documentation/widget/author.dart';
import 'package:documentation/widget/list_with_title.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FooterWidget extends StatefulWidget {
  final List<String> authorUrlSocialMedias;
  final DocumentationFooterData documentationFooterData;
  const FooterWidget({
    super.key,
    required this.authorUrlSocialMedias,
    required this.documentationFooterData,
  });

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
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
        const Divider(
          // height: 0.5,
          thickness: 0.5,
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Builder(
            builder: (context) {
              List<Widget> children = [
                AuthorWidget(
                  direction: Axis.vertical,
                  isShowTitle: true,
                  title: "My Social Media",
                  authorUrlSocialMedias: links,
                ),
              ];
              for (var element in widget.documentationFooterData.footers) {
                var footers = element.footer;
                children.add(ListWithWidget(
                  itemCount: footers.length,
                  isShowTitle: true,
                  title: "${element.title}".trim(),
                  direction: Axis.vertical,
                  authorUrlSocialMedias: widget.authorUrlSocialMedias,
                  builder: (context, index) {
                    FooterData footerData = footers[index];
                    return TextButton(
                      onPressed: () async {
                        await launchUrlString(footerData.url ?? "",
                            mode: LaunchMode.externalApplication);
                      },
                      child: Text(
                        "${footerData.title}".trim(),
                        style: TextStyle(
                          color: context.theme.indicatorColor,
                        ),
                      ),
                    );
                  },
                ));
              }
              if (context.orientation.isPortrait) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            "@ Copyright 2024 - ${DateTime.now().year}",
            style: TextStyle(
              color: context.theme.indicatorColor,
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }

  Widget sponsowrWidget({
    required String link,
  }) {
    IconData iconData = IonIcons.logo_chrome;
    String titleData = link;

    if (RegExp("(instagram)", caseSensitive: false).hasMatch(link)) {
      iconData = IonIcons.logo_instagram;
    } else if (RegExp("(youtube)", caseSensitive: false).hasMatch(link)) {
      iconData = IonIcons.logo_youtube;
    } else if (RegExp("(twitter)", caseSensitive: false).hasMatch(link)) {
      iconData = IonIcons.logo_twitter;
    } else if (RegExp("(github)", caseSensitive: false).hasMatch(link)) {
      iconData = IonIcons.logo_github;
    } else if (RegExp("(telegram|t[.]me)", caseSensitive: false)
        .hasMatch(link)) {
      iconData = Icons.telegram;
    }

    if (iconData == IonIcons.logo_chrome) {
      titleData = titleData.replaceAll(RegExp("(http(s)://)"), "").trim();
    } else {
      titleData = titleData.replaceAll(RegExp("(.*[/]|@)"), "").trim();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              iconData,
              color: context.theme.indicatorColor,
            )),
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
                    titleData,
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
      ],
    );
  }
}

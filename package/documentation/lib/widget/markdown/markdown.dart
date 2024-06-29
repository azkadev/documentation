// ignore_for_file: implementation_imports, duplicate_ignore, use_build_context_synchronously, unnecessary_brace_in_string_interps, empty_catches

import 'package:cool_alert/cool_alert.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:markdown_flutter/markdown_flutter.dart';
import 'package:markdown_widget/markdown_widget.dart';

import 'package:markdown_flutter/src/custom_text_node.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'images_node.dart';
// import 'package:gmss_app/widget/widget.dart';

class MarkdownDocumentationWidget extends StatelessWidget {
  final Future<String> Function() text;
  final EdgeInsets? padding;
  final Alignment alignment;
  const MarkdownDocumentationWidget({
    super.key,
    this.padding,
    required this.alignment,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: text(),
      builder: (context, snapshot) {
        if (snapshot.data is String) {
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            removeLeft: true,
            removeRight: true,
            child: MarkdownFlutterWidget(
              data: snapshot.data!.trim(),
              shrinkWrap: true,
              padding: padding,
              markdownGeneratorConfig: MarkdownGenerator(
                generators: [
                  mediaGeneratorWithTag,
                  // videoGeneratorWithTag,
                  SpanNodeGeneratorWithTag(
                    // <text data="https://www.youtube.com/watch?v=HjgD6ZhSFIA">
                    tag: "text",

                    generator: (e, config, visitor) {
                      return MarkdownTextCustomNode(
                        attribute: e.attributes,
                      );
                    },
                  ),
                  SpanNodeGeneratorWithTag(
                    // <video src="https://www.youtube.com/watch?v=HjgD6ZhSFIA">
                    tag: "callback_data",

                    generator: (e, config, visitor) {
                      return MarkdownTextNode(
                        attribute: e.attributes,
                      );
                    },
                  ),
                ],
                textGenerator: (node, config, visitor) {
                  return CustomTextNode(
                    node.textContent,
                    config,
                    visitor,
                  );
                },
              ),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class MarkdownTextNode extends SpanNode {
  final Map<String, String> attribute;
  // final GeneralClientFlutter generalClientFlutter;

  MarkdownTextNode({
    required this.attribute,
    // required this.generalClientFlutter,
  });

  @override
  InlineSpan build() {
    String text = attribute["text"] ?? '';
    String data = attribute["data"] ?? "";

    return WidgetSpan(
      child: CallbackDataWidget(
        text: text,
        data: data,
      ),
    );
  }
}

class CallbackDataWidget extends StatefulWidget {
  final String text;
  final String data;
  const CallbackDataWidget({
    super.key,
    required this.text,
    required this.data,
  });

  @override
  State<CallbackDataWidget> createState() => _CallbackDataWidgetState();
}

class _CallbackDataWidgetState extends State<CallbackDataWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: Text(
        widget.text,
        style: const TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}

class MarkdownTextCustomNode extends SpanNode {
  final Map<String, String> attribute;
  // final GeneralClientFlutter generalClientFlutter;

  MarkdownTextCustomNode({
    required this.attribute,
    // required this.generalClientFlutter,
  });

  @override
  InlineSpan build() {
    return WidgetSpan(
      child: MarkdownTextNodeCustomWidget(
        attribute: attribute,
        // generalClientFlutter: generalClientFlutter,
      ),
    );
  }
}

class MarkdownTextNodeCustomWidget extends StatefulWidget {
  final Map<String, String> attribute;
  const MarkdownTextNodeCustomWidget({
    super.key,
    required this.attribute,
    // required super.generalClientFlutter,
  });

  @override
  State<MarkdownTextNodeCustomWidget> createState() =>
      _MarkdownTextNodeCustomWidgetState();
}

class _MarkdownTextNodeCustomWidgetState
    extends State<MarkdownTextNodeCustomWidget> {
  @override
  Widget build(BuildContext context) {
    String url = () {
      if (widget.attribute["url"] is String &&
          (widget.attribute["url"] as String).isNotEmpty) {
        return (widget.attribute["url"] as String);
      }
      return "";
    }();
    double? fontSize = () {
      try {
        double sizeFont =
            (int.tryParse(widget.attribute["size"] ?? "0") ?? 0).toDouble();
        if (sizeFont > 0) {
          return sizeFont;
        }
      } catch (e) {}
      return null;
    }();

    // if (fontSize)
    Widget child = () {
      Widget child = EasyRichText(
        "${widget.attribute["data"]}".trim(),
        patternList: const [],
        defaultStyle: TextStyle(
          // fontFamily: "NotoEmoji",
          color: (url.isNotEmpty) ? Colors.blue : null,
          fontSize: fontSize,
        ),
      );

      if (url.isNotEmpty) {
        return InkWell(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            CoolAlert.show(
              context: context,
              type: CoolAlertType.info,
              title: """
Apakah anda yakin?
"""
                  .trim(),
              text: "Open: ${url}".trim(),
              onConfirmBtnTap: () async {
                await launchUrlString(url, mode: LaunchMode.externalApplication
                    // webViewConfiguration: WebViewConfiguration(
                    //   headers: {
                    //     "Refferer": "app"
                    //   },
                    // ),
                    );
              },
            );
          },
          child: child,
        );
      }
      return child;
    }();
    if (widget.attribute["is_center"] == "true") {
      return Center(
        child: child,
      );
    }

    return child;
  }
}

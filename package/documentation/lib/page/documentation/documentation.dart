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
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:documentation/scheme/scheme.dart';
import 'package:documentation/widget/footer.dart';
import 'package:documentation/widget/markdown/markdown.dart';

class DocumentationPageDocumentation extends StatefulWidget {
  final DocsData docsData;
  final List<String> authorUrlSocialMedias;
  final DocumentationFooterData documentationFooterData;
  final GeneralLibFlutterApp generalLibFlutterApp;
  const DocumentationPageDocumentation({
    super.key,
    required this.docsData,
    required this.authorUrlSocialMedias,
    required this.documentationFooterData,
    required this.generalLibFlutterApp,
  });

  @override
  State<DocumentationPageDocumentation> createState() => _DocumentationPageDocumentationState();
}

class _DocumentationPageDocumentationState extends State<DocumentationPageDocumentation> {
  GlobalKey globalKey = GlobalKey();

  ScrollControllerAutoKeepStateData scroll_controller_auto__keep_state_data = ScrollControllerAutoKeepStateData(keyId: "documentation_page");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      refresh();
    });
  }

  Future<void> refresh() async {
    setState(() {});

    bool is_succes = await Future(() async {
      try {
        setState(() {});
        setContent(contentId: widget.docsData.sidebars.first.navigate_content_id ?? "");
        return true;
      } catch (e) {
        context.navigator().pop();
        return false;
      }
    });

    if (is_succes) {
      setState(() {});
    }
  }

  void setContent({
    required String contentId,
  }) {
    navigate_content_id = contentId;
    setState(() {});
    content = widget.docsData.contents.firstWhere((element) => element.content_id == navigate_content_id).content ?? "";
    setState(() {});
  }

  String navigate_content_id = "";

  String content = "";

  @override
  void dispose() {
    navigate_content_id = "";
    content = "";
    scroll_controller_auto__keep_state_data.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          context.width,
          450,
        ),
        child: Container(
          key: globalKey,
          decoration: BoxDecoration(
            // borderRadius: const BorderRadius.only(
            //   bottomLeft: Radius.circular(40),
            //   bottomRight: Radius.circular(40),
            // ),
            color: context.theme.dialogBackgroundColor.withOpacity(0.85),
            boxShadow: [
              BoxShadow(
                color: context.theme.shadowColor.withAlpha(110),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.mediaQueryData.padding.top,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.navigator().pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      shadows: [
                        BoxShadow(
                          color: context.theme.shadowColor.withAlpha(110),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${widget.docsData.title}".trim(),
                    style: TextStyle(
                      fontSize: 20,
                      color: context.theme.indicatorColor,
                      shadows: [
                        BoxShadow(
                          color: context.theme.shadowColor.withAlpha(110),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  // auto change theme
                  Builder(
                    builder: (context) {
                      // theme mode
                      return IconButton(
                        onPressed: () {
                          widget.generalLibFlutterApp.autoChangeTheme(
                            onChangeBrightness: () {
                              return context.mediaQueryData.platformBrightness;
                            },
                          );
                          setState(() {});
                        },
                        icon: Icon(
                          () {
                            if (widget.generalLibFlutterApp.themeMode == ThemeMode.dark) {
                              return Icons.dark_mode;
                            }
                            if (widget.generalLibFlutterApp.themeMode == ThemeMode.light) {
                              return Icons.light_mode;
                            }

                            return Icons.auto_mode;
                          }(),
                          shadows: [
                            BoxShadow(
                              color: context.theme.shadowColor.withAlpha(110),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.height,
          minWidth: context.width,
          maxHeight: context.height,
          maxWidth: context.width,
        ),
        child: Column(
          children: [
            SizedBox.fromSize(
              size: globalKey.sizeRenderBox(),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: bodySideBar(),
                  ),
                  VerticalDivider(
                    color: context.theme.cardColor,
                  ),
                  Expanded(
                    flex: 5,
                    child: bodyContent(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodySideBar() {
    List<Widget> children = [];

    for (var element in widget.docsData.sidebars) {
       children.add(
        TextButton(
          onPressed: () async {
            setContent(contentId: element.navigate_content_id ?? "");
          },
          child: Text(
            "${element.title}",
            style: TextStyle(
              color: (element.navigate_content_id == navigate_content_id) ? context.theme.indicatorColor : context.theme.cardColor,
              fontSize: 15,
              shadows: [
                BoxShadow(
                  color: context.theme.shadowColor.withAlpha(110),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
        ),
      );
    }
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.height - globalKey.sizeRenderBox().height,
          minWidth: context.width,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget bodyContent() {
    return scroll_controller_auto__keep_state_data.build(
      child: Builder(
        builder: (context) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            controller: scroll_controller_auto__keep_state_data.scroll_controller,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: context.height - globalKey.sizeRenderBox().height,
                minWidth: context.width,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: MarkdownDocumentationWidget(
                      alignment: Alignment.center,
                      text: () async {
                        return content.trim();
                      },
                    ),
                  ),
                  FooterDocumentationWidget(
                    authorUrlSocialMedias: widget.authorUrlSocialMedias,
                    documentationFooterData: widget.documentationFooterData,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

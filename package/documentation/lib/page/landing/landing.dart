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
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:documentation/page/documentation/documentation.dart';
import 'package:documentation/scheme/scheme.dart';
import 'package:documentation/widget/author.dart';
import 'package:documentation/widget/footer.dart';
import 'package:documentation/widget/markdown/markdown.dart';

class LandingPageDocumentation extends StatefulWidget {
  final DocumentationData documentationData;
  final GeneralLibFlutterApp generalLibFlutterApp;
  const LandingPageDocumentation({
    super.key,
    required this.documentationData,
    required this.generalLibFlutterApp,
  });

  @override
  State<LandingPageDocumentation> createState() => _LandingPageDocumentationState();
}

class _LandingPageDocumentationState extends State<LandingPageDocumentation> {
  GlobalKey globalKey = GlobalKey();
  ScrollControllerAutoKeepStateData scroll_controller_auto__keep_state_data = ScrollControllerAutoKeepStateData(keyId: "documentation_page_landing");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      refresh();
    });
  }

  Future<void> refresh() async {
    setState(() {});
    setState(() {});
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
              Builder(
                builder: (context) {
                  List<Widget> children = [
                    TextButton(
                      onPressed: () async {
                        context.navigator().pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return LandingPageDocumentation(
                              documentationData: widget.documentationData,
                              generalLibFlutterApp: widget.generalLibFlutterApp,
                            );
                          },
                        ));
                      },
                      child: Text(
                        "${widget.documentationData.title}".trim(),
                        style: TextStyle(
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
                  ];
                  if (context.navigator().canPop()) {
                    children.insert(
                      0,
                      IconButton(
                        onPressed: () {
                          context.navigator().pop();
                        },
                        icon: Icon(Icons.arrow_back, 
                          shadows: [
                            BoxShadow(
                              color: context.theme.shadowColor.withAlpha(110),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],),
                      ),
                    );
                  }
                  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: children);
                },
              ),
            ],
          ),
        ),
      ),
      body: scroll_controller_auto__keep_state_data.build(
        child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              controller: scroll_controller_auto__keep_state_data.scroll_controller,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: context.height,
                  minWidth: context.width,
                  maxHeight: double.maxFinite,
                  // maxWidth: context.width,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox.fromSize(
                      size: globalKey.sizeRenderBox(),
                    ),
                    //
                    //

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: "${widget.documentationData.logo}".trim().isNotEmpty,
                            child: Image.asset(
                              "${widget.documentationData.logo}",
                            ),
                          ),
                          Text(
                            "${widget.documentationData.title}".trim(),
                            style: TextStyle(
                              color: context.theme.indicatorColor,
                              fontSize: 30,
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
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${widget.documentationData.description}".trim(),
                            style: TextStyle(
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
                            textAlign: TextAlign.center,
                          ),

                          //
                          AuthorDocumentationWidget(
                            authorUrlSocialMedias: widget.documentationData.author_url_social_medias,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: MarkdownDocumentationWidget(
                        alignment: Alignment.center,
                        text: () async {
                          return (widget.documentationData.content ?? "").trim();
                        },
                      ),
                    ),

                    //
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Example Project Use This Library",
                            style: TextStyle(
                              color: context.theme.indicatorColor,
                              fontSize: 30,
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
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            """
Berikut adalah beberapa contoh project yang menggunakan library ${widget.documentationData.title}
"""
                                .trim(),
                            style: TextStyle(
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
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    //
                    //

                    //
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Docs",
                            style: TextStyle(
                              color: context.theme.indicatorColor,
                              fontSize: 30,
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
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Builder(
                        builder: (context) {
                          List<DocsData> docs = widget.documentationData.docs;
                          return GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5, childAspectRatio: 16 / 9),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: docs.length,
                            padding: const EdgeInsets.all(20),
                            itemBuilder: (context, index) {
                              DocsData docsData = docs[index];
                              return Column(
                                children: [
                                  Flexible(
                                    child: Text(
                                      "${docsData.title}",
                                      style: TextStyle(
                                        color: context.theme.indicatorColor,
                                        fontSize: 20,
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${docsData.description}".trim(),
                                      style: TextStyle(
                                        shadows: [
                                          BoxShadow(
                                            color: context.theme.shadowColor.withAlpha(110),
                                            spreadRadius: 1,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: context.theme.dialogBackgroundColor.withOpacity(0.85),
                                      borderRadius: BorderRadiusDirectional.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: context.theme.shadowColor.withAlpha(110),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: MaterialButton(
                                      onPressed: () async {
                                        context.navigator().push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return DocumentationPageDocumentation(
                                                docsData: docsData,
                                                authorUrlSocialMedias: widget.documentationData.author_url_social_medias,
                                                documentationFooterData: widget.documentationData.footer,
                                                generalLibFlutterApp: widget.generalLibFlutterApp,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Read More",
                                        style: TextStyle(

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
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    FooterDocumentationWidget(
                      authorUrlSocialMedias: widget.documentationData.author_url_social_medias,
                      documentationFooterData: widget.documentationData.footer,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

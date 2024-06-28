import 'package:flutter/material.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:documentation/page/documentation/documentation.dart';
import 'package:documentation/scheme/scheme.dart';
import 'package:documentation/documentation_main.dart';
import 'package:documentation/widget/author.dart';
import 'package:documentation/widget/footer.dart';
import 'package:documentation/widget/markdown/markdown.dart';

class LandingPageDocumentation extends StatefulWidget {
  final DocumentationData documentationData;
  const LandingPageDocumentation({super.key, required this.documentationData});

  @override
  State<LandingPageDocumentation> createState() =>
      _LandingPageDocumentationState();
}

class _LandingPageDocumentationState extends State<LandingPageDocumentation> {
  GlobalKey globalKey = GlobalKey();
  ScrollController scrollController = ScrollController();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      context.navigator().pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return LandingPageDocumentation(
                            documentationData: widget.documentationData,
                          );
                        },
                      ));
                    },
                    child: Text(
                      "${widget.documentationData.title}".trim(),
                      style: TextStyle(
                        color: context.theme.indicatorColor,
                      ),
                    ),
                  ),
                  // auto change theme
                  Builder(
                    builder: (context) {
                      // theme mode
                      return IconButton(
                        onPressed: () {
                          DocumentationMainApp.generalLibFlutterApp
                              .autoChangeTheme(
                            onChangeBrightness: () {
                              return context.mediaQueryData.platformBrightness;
                            },
                          );
                          setState(() {});
                        },
                        icon: Icon(
                          () {
                            if (DocumentationMainApp
                                    .generalLibFlutterApp.themeMode ==
                                ThemeMode.dark) {
                              return Icons.dark_mode;
                            }
                            if (DocumentationMainApp
                                    .generalLibFlutterApp.themeMode ==
                                ThemeMode.light) {
                              return Icons.light_mode;
                            }

                            return Icons.auto_mode;
                          }(),
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
      body: SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
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
                    Image.asset(
                      "${widget.documentationData.logo}",
                    ),
                    Text(
                      "${widget.documentationData.title}".trim(),
                      style: TextStyle(
                        color: context.theme.indicatorColor,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${widget.documentationData.description}".trim(),
                      style: TextStyle(
                        color: context.theme.indicatorColor,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    //
                    AuthorWidget(
                      authorUrlSocialMedias:
                          widget.documentationData.author_url_social_medias,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: MarkdownWidget(
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              childAspectRatio: 16 / 9),
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
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Flexible(
                              child: Text(
                                "${docsData.description}".trim(),
                                // overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: context.theme.dialogBackgroundColor
                                    .withOpacity(0.85),
                                borderRadius:
                                    BorderRadiusDirectional.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: context.theme.shadowColor
                                        .withAlpha(110),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
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
                                          authorUrlSocialMedias: widget
                                              .documentationData
                                              .author_url_social_medias,
                                          documentationFooterData:
                                              widget.documentationData.footer,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Read More",
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
              FooterWidget(
                authorUrlSocialMedias:
                    widget.documentationData.author_url_social_medias,
                documentationFooterData: widget.documentationData.footer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

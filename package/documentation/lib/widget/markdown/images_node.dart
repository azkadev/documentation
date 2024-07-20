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
// ignore_for_file:, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:markdown_widget/markdown_widget.dart';

import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

// import 'widget.dart';

SpanNodeGeneratorWithTag mediaGeneratorWithTag = SpanNodeGeneratorWithTag(
  // <medias src="https://www.youtube.com/watch?v=HjgD6ZhSFIA">
  tag: "medias",
  generator: (e, config, visitor) {
    return MediasNode(e.attributes);
  },
);

class MediasNode extends SpanNode {
  final Map<String, String> attribute;

  MediasNode(this.attribute);

  @override
  InlineSpan build() {
    double? width;
    double? height;
    if (attribute['width'] != null) {
      width = double.tryParse(attribute['width'] ?? "0");
    }
    if (attribute['height'] != null) {
      height = double.tryParse(attribute['height'] ?? "0");
    }

    List<String> medias = (attribute['src'] ?? "").split(" ");

    return WidgetSpan(
      child: SizedBox(
        height: height,
        width: width,
        child: MediasWidget(
          medias: medias,
        ),
      ),
    );
  }
}

class MediasWidget extends StatefulWidget {
  final List<String> medias;
  const MediasWidget({
    super.key,
    required this.medias,
  });

  @override
  State<MediasWidget> createState() => _ImagesWidgetState();
}

class _ImagesWidgetState extends State<MediasWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.medias.isEmpty) {
      return const SizedBox.shrink();
    }

    if (widget.medias.length > 1) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: context.width * 0.55,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 16 / 9,
          ),
          itemCount: widget.medias.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(5),
          itemBuilder: (context, index) {
            String image_data = widget.medias[index];
            return mediaWidget(
              index: index + 1,
              image_data: image_data,
              isMoreData: false,
            );
          },
        ),
      );
    }

    return mediaWidget(
      image_data: widget.medias.firstOrNull ?? "",
      isMoreData: false,
      index: 1,
    );
  }

  Widget mediaWidget({
    required String image_data,
    required int index,
    required bool isMoreData,
  }) {
    bool is_youtube = false;
    Image? image = () {
      if (image_data.trim().isEmpty) {
        return null;
      }
      if (RegExp(r"^(http(s)?:)", caseSensitive: false).hasMatch(image_data)) {
        if (RegExp("(youtube.com)", caseSensitive: false).hasMatch(image_data)) {
          is_youtube = true;
        }
        return Image.network(
          image_data,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox.shrink();
          },
        );
      }
      if (RegExp(r"^(assets|packages)", caseSensitive: false).hasMatch(image_data)) {
        return Image.asset(
          image_data,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox.shrink();
          },
        );
      }
      return Image.file(
        File(image_data),
        errorBuilder: (context, error, stackTrace) {
          return const SizedBox.shrink();
        },
      );
    }();
    if (isMoreData == false) {
      return MaterialButton(
        onPressed: () {
          if (is_youtube) {
            launchUrlString(image_data, mode: LaunchMode.externalApplication);
            return;
          }
          if (image == null) {
            return;
          }
          Navigator.push(
            context,
            PageRouteBuilder(
              opaque: false,
              barrierColor: Colors.black,
              pageBuilder: (BuildContext context, _, __) {
                return FullScreenPage(
                  dark: true,
                  child: image,
                );
              },
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${index}".trim(),
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
            image ?? const SizedBox.shrink(),
          ],
        ),
      );
    }

    return Container(
      width: double.maxFinite,
      height: context.width * 0.55,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        // horizontal: 20
      ),
      decoration: BoxDecoration(
        color: context.theme.dialogBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10),
          BoxShadow(color: Colors.black12, blurRadius: 10),
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
        image: () {
          if (image == null) {
            return null;
          }
          return DecorationImage(
            fit: BoxFit.fill,
            image: image.image,
          );
        }(),
      ),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 20,
        ),
        onPressed: () async {
          if (is_youtube) {
            launchUrlString(image_data, mode: LaunchMode.externalApplication);
            return;
          }
          if (image == null) {
            return;
          }
          Navigator.push(
            context,
            PageRouteBuilder(
              opaque: false,
              barrierColor: Colors.black,
              pageBuilder: (BuildContext context, _, __) {
                return FullScreenPage(
                  dark: true,
                  child: image,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class FullScreenPage extends StatefulWidget {
  const FullScreenPage({
    super.key,
    required this.child,
    required this.dark,
  });

  final Widget child;
  final bool dark;

  @override
  FullScreenPageState createState() => FullScreenPageState();
}

class FullScreenPageState extends State<FullScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.dark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 333),
                curve: Curves.fastOutSlowIn,
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: InteractiveViewer(
                  panEnabled: true,
                  minScale: 0.5,
                  maxScale: 4,
                  child: widget.child,
                ),
              ),
            ],
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: MaterialButton(
                padding: const EdgeInsets.all(15),
                elevation: 0,
                color: widget.dark ? Colors.black12 : Colors.white70,
                highlightElevation: 0,
                minWidth: double.minPositive,
                height: double.minPositive,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back,
                  color: widget.dark ? Colors.white : Colors.black,
                  size: 25,

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
      ),
    );
  }
}

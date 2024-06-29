// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, empty_catches

// import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';

import 'package:general_lib_flutter/general_lib_flutter.dart';

import 'package:flutter/material.dart';
 
class ProfilePictureDocumentationWidget extends StatelessWidget {
  final String pathImage;
  final String nick_name;
  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final void Function(bool data)? onHighlightChanged;
  const ProfilePictureDocumentationWidget({
    super.key,
    required this.pathImage,
    required this.width,
    required this.height,
    this.nick_name = "-",
    this.borderRadius,
    this.onLongPress,
    this.onHighlightChanged,
    required this.onPressed,
  });

  String get path_image {
    return pathImage;
  }

  File get file {
    return File(pathImage);
  }

  @override
  Widget build(BuildContext context) {
    DecorationImage? image;
    if (path_image.isNotEmpty) {
      image = DecorationImage(
        fit: BoxFit.cover,
        image: () {
          if (RegExp(r"^(http(s)?)").hasMatch(pathImage)) {
            return Image.network(pathImage).image;
          }
          return Image.asset(pathImage).image;
        }(),
        // image: AssetImage(pathImage),
        onError: (errDetails, error) {},
      );
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: context.theme.dialogBackgroundColor,
        borderRadius: () {
          return (borderRadius != null)
              ? borderRadius
              : BorderRadius.circular(15);
        }(),
        image: image,
        boxShadow: [
          // BoxShadow(
          //   color: Colors.pink,
          //   offset: Offset(-2, 0),
          //   blurRadius: 7,
          // ),
          // BoxShadow(
          //   color: Colors.blue,
          //   offset: Offset(2, 0),
          //   blurRadius: 7,
          // ),
          BoxShadow(
            color: context.theme.shadowColor,
            spreadRadius: 2.5,
            blurRadius: 2.5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        clipBehavior: Clip.antiAlias,
        minWidth: 0,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHighlightChanged: onHighlightChanged,
        child: Visibility(
          visible: path_image.isEmpty,
          child: Center(
            child: Text(
              () {
                try {
                  return nick_name.characters.first;
                } catch (e) {}
                return "";
              }(),
              style: TextStyle(
                color: context.theme.indicatorColor,
                fontSize: 50,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

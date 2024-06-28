// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

class DocSideBar extends JsonScheme {
  DocSideBar(super.rawData);

  static Map get defaultData {
    return {
      "@type": "docSideBar",
      "title": "",
      "navigate_content_id": "content"
    };
  }

  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  set special_type(String? value) {
    rawData["@type"] = value;
  }

  String? get title {
    try {
      if (rawData["title"] is String == false) {
        return null;
      }
      return rawData["title"] as String;
    } catch (e) {
      return null;
    }
  }

  set title(String? value) {
    rawData["title"] = value;
  }

  String? get navigate_content_id {
    try {
      if (rawData["navigate_content_id"] is String == false) {
        return null;
      }
      return rawData["navigate_content_id"] as String;
    } catch (e) {
      return null;
    }
  }

  set navigate_content_id(String? value) {
    rawData["navigate_content_id"] = value;
  }

  static DocSideBar create({
    String special_type = "docSideBar",
    String? title,
    String? navigate_content_id,
  }) {
    // DocSideBar docSideBar = DocSideBar({
    Map docSideBar_data_create_json = {
      "@type": special_type,
      "title": title,
      "navigate_content_id": navigate_content_id,
    };

    docSideBar_data_create_json.removeWhere((key, value) => value == null);
    DocSideBar docSideBar_data_create = DocSideBar(docSideBar_data_create_json);

    return docSideBar_data_create;
  }
}

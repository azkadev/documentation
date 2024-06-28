// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

class LinkData extends JsonScheme {
  LinkData(super.rawData);

  static Map get defaultData {
    return {"@type": "linkData", "icon": "", "title": "", "value": ""};
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

  String? get icon {
    try {
      if (rawData["icon"] is String == false) {
        return null;
      }
      return rawData["icon"] as String;
    } catch (e) {
      return null;
    }
  }

  set icon(String? value) {
    rawData["icon"] = value;
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

  String? get value {
    try {
      if (rawData["value"] is String == false) {
        return null;
      }
      return rawData["value"] as String;
    } catch (e) {
      return null;
    }
  }

  set value(String? value) {
    rawData["value"] = value;
  }

  static LinkData create({
    String special_type = "linkData",
    String? icon,
    String? title,
    String? value,
  }) {
    // LinkData linkData = LinkData({
    Map linkData_data_create_json = {
      "@type": special_type,
      "icon": icon,
      "title": title,
      "value": value,
    };

    linkData_data_create_json.removeWhere((key, value) => value == null);
    LinkData linkData_data_create = LinkData(linkData_data_create_json);

    return linkData_data_create;
  }
}

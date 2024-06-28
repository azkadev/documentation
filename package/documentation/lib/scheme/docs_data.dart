// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "doc_side_bar.dart";
import "doc_contents.dart";

class DocsData extends JsonScheme {
  DocsData(super.rawData);

  static Map get defaultData {
    return {
      "@type": "docsData",
      "doc_id": "",
      "title": "",
      "description": "",
      "sidebars": [
        {"@type": "docSideBar", "title": "", "navigate_content_id": "content"}
      ],
      "contents": [
        {"@type": "docContents", "content_id": "", "content": ""}
      ]
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

  String? get doc_id {
    try {
      if (rawData["doc_id"] is String == false) {
        return null;
      }
      return rawData["doc_id"] as String;
    } catch (e) {
      return null;
    }
  }

  set doc_id(String? value) {
    rawData["doc_id"] = value;
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

  String? get description {
    try {
      if (rawData["description"] is String == false) {
        return null;
      }
      return rawData["description"] as String;
    } catch (e) {
      return null;
    }
  }

  set description(String? value) {
    rawData["description"] = value;
  }

  List<DocSideBar> get sidebars {
    try {
      if (rawData["sidebars"] is List == false) {
        return [];
      }
      return (rawData["sidebars"] as List)
          .map((e) => DocSideBar(e as Map))
          .toList()
          .cast<DocSideBar>();
    } catch (e) {
      return [];
    }
  }

  set sidebars(List<DocSideBar> values) {
    rawData["sidebars"] = values.map((value) => value.toJson()).toList();
  }

  List<DocContents> get contents {
    try {
      if (rawData["contents"] is List == false) {
        return [];
      }
      return (rawData["contents"] as List)
          .map((e) => DocContents(e as Map))
          .toList()
          .cast<DocContents>();
    } catch (e) {
      return [];
    }
  }

  set contents(List<DocContents> values) {
    rawData["contents"] = values.map((value) => value.toJson()).toList();
  }

  static DocsData create({
    String special_type = "docsData",
    String? doc_id,
    String? title,
    String? description,
    List<DocSideBar>? sidebars,
    List<DocContents>? contents,
  }) {
    // DocsData docsData = DocsData({
    Map docsData_data_create_json = {
      "@type": special_type,
      "doc_id": doc_id,
      "title": title,
      "description": description,
      "sidebars": (sidebars != null) ? sidebars.toJson() : null,
      "contents": (contents != null) ? contents.toJson() : null,
    };

    docsData_data_create_json.removeWhere((key, value) => value == null);
    DocsData docsData_data_create = DocsData(docsData_data_create_json);

    return docsData_data_create;
  }
}

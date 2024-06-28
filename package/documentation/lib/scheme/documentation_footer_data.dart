// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "footers_data.dart";

class DocumentationFooterData extends JsonScheme {
  DocumentationFooterData(super.rawData);

  static Map get defaultData {
    return {
      "@type": "documentationFooterData",
      "footers": [
        {
          "@type": "footersData",
          "title": "",
          "footer": [
            {"@type": "footerData", "text": "", "url": ""}
          ]
        }
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

  List<FootersData> get footers {
    try {
      if (rawData["footers"] is List == false) {
        return [];
      }
      return (rawData["footers"] as List)
          .map((e) => FootersData(e as Map))
          .toList()
          .cast<FootersData>();
    } catch (e) {
      return [];
    }
  }

  set footers(List<FootersData> values) {
    rawData["footers"] = values.map((value) => value.toJson()).toList();
  }

  static DocumentationFooterData create({
    String special_type = "documentationFooterData",
    List<FootersData>? footers,
  }) {
    // DocumentationFooterData documentationFooterData = DocumentationFooterData({
    Map documentationFooterData_data_create_json = {
      "@type": special_type,
      "footers": (footers != null) ? footers.toJson() : null,
    };

    documentationFooterData_data_create_json
        .removeWhere((key, value) => value == null);
    DocumentationFooterData documentationFooterData_data_create =
        DocumentationFooterData(documentationFooterData_data_create_json);

    return documentationFooterData_data_create;
  }
}

// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "footer_data.dart";

 
class FootersData extends JsonScheme {

  
  FootersData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"footersData","title":"","footer":[{"@type":"footerData","text":"","url":""}]};
  }

  
  String? get special_type {
    try {
      if (rawData["@type"] is String == false){
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
      if (rawData["title"] is String == false){
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

  
  List<FooterData> get footer {
    try {
      if (rawData["footer"] is List == false){
        return [];
      }
      return (rawData["footer"] as List).map((e) => FooterData(e as Map)).toList().cast<FooterData>();
    } catch (e) {
      return [];
    }
  }


  
  set footer(List<FooterData> values) {
    rawData["footer"] = values.map((value) => value.toJson()).toList();
  }



  
  static FootersData create({

    String special_type = "footersData",
    String? title,
      List<FooterData>? footer,
})  {
    // FootersData footersData = FootersData({
Map footersData_data_create_json = {
  
      "@type": special_type,
      "title": title,
      "footer": (footer != null)? footer.toJson(): null,


};


          footersData_data_create_json.removeWhere((key, value) => value == null);
FootersData footersData_data_create = FootersData(footersData_data_create_json);

return footersData_data_create;



      }
}
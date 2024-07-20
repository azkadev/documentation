// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "docs_data.dart";
import "documentation_footer_data.dart";

 
class DocumentationData extends JsonScheme {

  
  DocumentationData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"documentationData","logo":"","title":"","description":"","content":"","author_url_social_medias":["url"],"docs":[{"@type":"docsData","doc_id":"","title":"","description":"","sidebars":[{"@type":"docSideBar","title":"","navigate_content_id":"content"}],"contents":[{"@type":"docContents","content_id":"","content":""}]}],"footer":{"@type":"documentationFooterData","footers":[{"@type":"footersData","title":"","footer":[{"@type":"footerData","text":"","url":""}]}]}};
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


  
  String? get logo {
    try {
      if (rawData["logo"] is String == false){
        return null;
      }
      return rawData["logo"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set logo(String? value) {
    rawData["logo"] = value;
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


  
  String? get description {
    try {
      if (rawData["description"] is String == false){
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


  
  String? get content {
    try {
      if (rawData["content"] is String == false){
        return null;
      }
      return rawData["content"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set content(String? value) {
    rawData["content"] = value;
  }


  
  List<String> get author_url_social_medias {
    try {
      if (rawData["author_url_social_medias"] is List == false){
        return [];
      }
      return (rawData["author_url_social_medias"] as List).cast<String>();
    } catch (e) {
      return [];
    }
  }


  
  set author_url_social_medias(List<String> value) {
    rawData["author_url_social_medias"] = value;
  }

  
  List<DocsData> get docs {
    try {
      if (rawData["docs"] is List == false){
        return [];
      }
      return (rawData["docs"] as List).map((e) => DocsData(e as Map)).toList().cast<DocsData>();
    } catch (e) {
      return [];
    }
  }


  
  set docs(List<DocsData> values) {
    rawData["docs"] = values.map((value) => value.toJson()).toList();
  }



  
  DocumentationFooterData get footer {
    try {
      if (rawData["footer"] is Map == false){
        return DocumentationFooterData({}); 
      }
      return DocumentationFooterData(rawData["footer"] as Map);
    } catch (e) {  
      return DocumentationFooterData({}); 
    }
  }


  
  set footer(DocumentationFooterData value) {
    rawData["footer"] = value.toJson();
  }



  
  static DocumentationData create({

    String special_type = "documentationData",
    String? logo,
    String? title,
    String? description,
    String? content,
      List<String>? author_url_social_medias,
      List<DocsData>? docs,
      DocumentationFooterData? footer,
})  {
    // DocumentationData documentationData = DocumentationData({
Map documentationData_data_create_json = {
  
      "@type": special_type,
      "logo": logo,
      "title": title,
      "description": description,
      "content": content,
      "author_url_social_medias": author_url_social_medias,
      "docs": (docs != null)? docs.toJson(): null,
      "footer": (footer != null)?footer.toJson(): null,


};


          documentationData_data_create_json.removeWhere((key, value) => value == null);
DocumentationData documentationData_data_create = DocumentationData(documentationData_data_create_json);

return documentationData_data_create;



      }
}
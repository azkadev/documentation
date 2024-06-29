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
// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "link_data.dart";

class AccountData extends JsonScheme {
  AccountData(super.rawData);

  static Map get defaultData {
    return {
      "@type": "accountData",
      "id": 0,
      "first_name": "",
      "last_name": "",
      "username": "",
      "profile_picture": "",
      "bio": "",
      "social_medias": [
        {"@type": "linkData", "icon": "", "title": "", "value": ""}
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

  num? get id {
    try {
      if (rawData["id"] is num == false) {
        return null;
      }
      return rawData["id"] as num;
    } catch (e) {
      return null;
    }
  }

  set id(num? value) {
    rawData["id"] = value;
  }

  String? get first_name {
    try {
      if (rawData["first_name"] is String == false) {
        return null;
      }
      return rawData["first_name"] as String;
    } catch (e) {
      return null;
    }
  }

  set first_name(String? value) {
    rawData["first_name"] = value;
  }

  String? get last_name {
    try {
      if (rawData["last_name"] is String == false) {
        return null;
      }
      return rawData["last_name"] as String;
    } catch (e) {
      return null;
    }
  }

  set last_name(String? value) {
    rawData["last_name"] = value;
  }

  String? get username {
    try {
      if (rawData["username"] is String == false) {
        return null;
      }
      return rawData["username"] as String;
    } catch (e) {
      return null;
    }
  }

  set username(String? value) {
    rawData["username"] = value;
  }

  String? get profile_picture {
    try {
      if (rawData["profile_picture"] is String == false) {
        return null;
      }
      return rawData["profile_picture"] as String;
    } catch (e) {
      return null;
    }
  }

  set profile_picture(String? value) {
    rawData["profile_picture"] = value;
  }

  String? get bio {
    try {
      if (rawData["bio"] is String == false) {
        return null;
      }
      return rawData["bio"] as String;
    } catch (e) {
      return null;
    }
  }

  set bio(String? value) {
    rawData["bio"] = value;
  }

  List<LinkData> get social_medias {
    try {
      if (rawData["social_medias"] is List == false) {
        return [];
      }
      return (rawData["social_medias"] as List)
          .map((e) => LinkData(e as Map))
          .toList()
          .cast<LinkData>();
    } catch (e) {
      return [];
    }
  }

  set social_medias(List<LinkData> values) {
    rawData["social_medias"] = values.map((value) => value.toJson()).toList();
  }

  static AccountData create({
    String special_type = "accountData",
    num? id,
    String? first_name,
    String? last_name,
    String? username,
    String? profile_picture,
    String? bio,
    List<LinkData>? social_medias,
  }) {
    // AccountData accountData = AccountData({
    Map accountData_data_create_json = {
      "@type": special_type,
      "id": id,
      "first_name": first_name,
      "last_name": last_name,
      "username": username,
      "profile_picture": profile_picture,
      "bio": bio,
      "social_medias": (social_medias != null) ? social_medias.toJson() : null,
    };

    accountData_data_create_json.removeWhere((key, value) => value == null);
    AccountData accountData_data_create =
        AccountData(accountData_data_create_json);

    return accountData_data_create;
  }
}

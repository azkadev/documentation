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
import 'package:documentation/scheme/scheme.dart';

DocumentationData get documentationData => DocumentationData.create(
    title: "Example Documentation",
    logo: "",
    description: """
Example Adalah sebuah library yang memungkinkan anda membuat project dengan cepat
""",
    content: """
<h2 align="center">Ultra Fast, Enjoyable & Cross Platform Telegram Client</h2>

**Telegram Client** Dart **library** for make telegram base flutter **bot**, **userbot**, **App** Support Run Server Side And Client Side, This library 100% easy for make multiples **client or accounts** because this library you just call function not execute shell command so update account will show at function event emitter

## Features

- 🚀 **Work On Cross Platform**: Mobile, Desktop, Browser, Server Side
- ⚡ **Good Performance and efficient**
- ❤️ **Simple, Easey Powerfull, Can Extend To Scala Bussiness**


## Guide on how to use this library

Before using this library, make sure you know basic coding
And your laptop has the programming language installed [dart](https://dart.dev)

### Install Library

1. Install Library
   
   To install the library you need to type the command below in the terminal

```bash
dart pub add telegram_client
```
   
  If you want to create your application use this command

1. For Flutter
```bash
flutter pub add telegram_client telegram_client_linux telegram_client_android telegram_client_ios telegram_client_macos telegram_client_windows
```

### Add Library

```dart
import 'package:telegram_client/telegram_client.dart';
``` 

### Quick Start

```dart
import 'package:telegram_client/telegram_client/telegram_client.dart';

void main(List<String> args) {
  TelegramClient tg = TelegramClient();
  tg.ensureInitialized();
  tg.on(
    event_name: tg.event_update,
    onUpdate: (updateTelegramClient) {
      // kode
    },
    onError: (error, stackTrace) {},
  );
  tg.tdlib.initIsolate();
}
``` 

## Important

**I really need funds so that this library can be easier to use. You can buy this library by subscribing/sponsoring me on GitHub:** [AZKADEV](https://github.com/azkadev)


"""
        .trim(),
    author_url_social_medias: {
      "https://youtube.com/@azkadev",
      "https://github.com/azkadev",
      "https://t.me/azkadev",
      "https://instagram.com/azka.developer",
      "https://twitter.com/azka_dev",
      "https://azkadev.netlify.app",
      // "https://tiktok.com/azkadev",
    }.toList(),
    footer: DocumentationFooterData.create(
      footers: [
        FootersData.create(
          title: "Other Information",
          footer: [
            FooterData.create(
              title: "About",
            ),
            FooterData.create(title: "Buy My Services On Telegram 🥺", url: "https://t.me/azkadevbot?start=ref_web_documentation"),
            FooterData.create(title: "Donate Me 🥺", url: "https://github.com/sponsor/azkadev"),
            FooterData.create(title: "Donate Me On Telegram 🥺", url: "https://t.me/azkadevbot?start=donate_web_documentation"),
          ],
        ),
        FootersData.create(
          title: "Other Library",
          footer: [
            FooterData.create(title: "Discord Client", url: "https://t.me/azkadevbot?start=ref_web_documentation"),
            FooterData.create(title: "DoodStream Client", url: "https://t.me/azkadevbot?start=ref_web_documentation"),
            FooterData.create(title: "Github Client", url: "https://t.me/azkadevbot?start=ref_web_documentation"),
            FooterData.create(title: "Google Client", url: "https://t.me/azkadevbot?start=ref_web_documentation"),
            FooterData.create(title: "Whatsapp Client", url: "https://t.me/azkadevbot?start=ref_web_documentation"),
          ],
        ),
      ],
    ),
    docs: List.generate(4, (index) {
      return DocsData.create(
        doc_id: "mtproto",
        title: "Mtproto",
        description: """
Mtproto adalah library yang paling ringan cepat tidak memerlukan ffi namun jika menggunakan ini harap jangan flood / mencoba call api
berkali kali karena api ini direct ke telegram langsung sehingga akan sangat mudah di banned jika menggunakan ini (api ini di gunakan jika anda sudah mahir coding + perhitungan limitasi api)
"""
            .trim(),
        sidebars: [
          DocSideBar.create(
            title: "Intro",
            navigate_content_id: "intro",
          ),
          DocSideBar.create(
            title: "Demo",
            navigate_content_id: "demo",
          ),
        ],
        contents: [
          DocContents.create(
            content_id: "intro",
            content: """

<h2 align="center">Ultra Fast, Enjoyable & Cross Platform Telegram Client</h2>

**Telegram Client** Dart **library** for make telegram base flutter **bot**, **userbot**, **App** Support Run Server Side And Client Side, This library 100% easy for make multiples **client or accounts** because this library you just call function not execute shell command so update account will show at function event emitter

## Features

- 🚀 **Work On Cross Platform**: Mobile, Desktop, Browser, Server Side
- ⚡ **Good Performance and efficient**
- ❤️ **Simple, Easey Powerfull, Can Extend To Scala Bussiness**

<medias src="${("assets/logo/telegram.png " * 5).trim()}">

## Guide on how to use this library

Before using this library, make sure you know basic coding
And your laptop has the programming language installed [dart](https://dart.dev)

### Install Library

1. Install Library
   
   To install the library you need to type the command below in the terminal

```bash
dart pub add telegram_client
```
   
  If you want to create your application use this command

1. For Flutter
```bash
flutter pub add telegram_client telegram_client_linux telegram_client_android telegram_client_ios telegram_client_macos telegram_client_windows
```

### Add Library

```dart
import 'package:telegram_client/telegram_client.dart';
``` 

### Quick Start

```dart
import 'package:telegram_client/telegram_client/telegram_client.dart';

void main(List<String> args) {
  TelegramClient tg = TelegramClient();
  tg.ensureInitialized();
  tg.on(
    event_name: tg.event_update,
    onUpdate: (updateTelegramClient) {
      // kode
    },
    onError: (error, stackTrace) {},
  );
  tg.tdlib.initIsolate();
}
``` 

## Important

**I really need funds so that this library can be easier to use. You can buy this library by subscribing/sponsoring me on GitHub:** [AZKADEV](https://github.com/azkadev)

"""
                .trim(),
          ),
          DocContents.create(
            content_id: "demo",
            content: """

f
<h2 align="center">Ultra Fast, Enjoyable & Cross Platform Telegram Client</h2>

**Telegram Client** Dart **library** for make telegram base flutter **bot**, **userbot**, **App** Support Run Server Side And Client Side, This library 100% easy for make multiples **client or accounts** because this library you just call function not execute shell command so update account will show at function event emitter

## Features

- 🚀 **Work On Cross Platform**: Mobile, Desktop, Browser, Server Side
- ⚡ **Good Performance and efficient**
- ❤️ **Simple, Easey Powerfull, Can Extend To Scala Bussiness**

<medias src="${("assets/logo/telegram.png " * 5).trim()}">

## Guide on how to use this library

Before using this library, make sure you know basic coding
And your laptop has the programming language installed [dart](https://dart.dev)

### Install Library

1. Install Library
   
   To install the library you need to type the command below in the terminal

```bash
dart pub add telegram_client
```
   
  If you want to create your application use this command

1. For Flutter
```bash
flutter pub add telegram_client telegram_client_linux telegram_client_android telegram_client_ios telegram_client_macos telegram_client_windows
```

### Add Library

```dart
import 'package:telegram_client/telegram_client.dart';
``` 

### Quick Start

```dart
import 'package:telegram_client/telegram_client/telegram_client.dart';

void main(List<String> args) {
  TelegramClient tg = TelegramClient();
  tg.ensureInitialized();
  tg.on(
    event_name: tg.event_update,
    onUpdate: (updateTelegramClient) {
      // kode
    },
    onError: (error, stackTrace) {},
  );
  tg.tdlib.initIsolate();
}
``` 

## Important

**I really need funds so that this library can be easier to use. You can buy this library by subscribing/sponsoring me on GitHub:** [AZKADEV](https://github.com/azkadev)

"""
                .trim(),
          )
        ],
      );
    }));

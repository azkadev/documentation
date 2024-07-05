import 'dart:io';

import 'package:general_lib/general_lib.dart';

void main(List<String> args)async {
  print(Dart.pub.installFromDirectory(directoryPackage: Directory.current));
}

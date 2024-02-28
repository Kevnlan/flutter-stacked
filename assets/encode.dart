import 'dart:io';

import 'package:rfw/formats.dart';

void main() {
  final String counterApp1 = File('test_home.rfwtxt').readAsStringSync();
  File('test_home.rfw').writeAsBytesSync(encodeLibraryBlob(parseLibraryFile(counterApp1)));
}

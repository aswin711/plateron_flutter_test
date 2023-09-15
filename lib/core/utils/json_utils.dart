import 'dart:io';


String readJson(String name) {
  var dir = Directory.current.path;

  print(dir);

  return File('$dir$name').readAsStringSync();
}
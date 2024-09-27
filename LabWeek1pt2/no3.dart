import 'dart:io';

main() {

  const double pi = 3.14;
  stdout.write("masukkan diameter lingkaran: ");

  double? d = double.parse(stdin.readLineSync()!);
  double r = d / 2; double l = pi * r * r;

  print("luas lingkaran diameter $d adalah $l");
}

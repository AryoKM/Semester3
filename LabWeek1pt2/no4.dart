import 'dart:io';

main() {
  stdout.write("masukkan suhu (°C): ");
  double? celsius = double.parse(stdin.readLineSync()!);

  double fahrenheit = (celsius * 9/5) + 32;

  print("suhu dalam Fahrenheit: $fahrenheit °F");
}

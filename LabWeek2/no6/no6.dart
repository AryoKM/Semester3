import 'dart:io'; import 'no6(2).dart';

void main() {
  ubahtemp converter = ubahtemp();

  print('masukkan tempratur (Celcius):');
  converter.celsius = double.parse(stdin.readLineSync()!);

  print('pilih konversi:\n1. Fahrenheit\n2. Kelvin\n3. Reamur\n');
  int choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      print('${converter.celsius}° Celsius sama dengan ${converter.fahrenheit}° Fahrenheit');
      break;
    case 2:
      print('${converter.celsius}° Celsius sama dengan ${converter.kelvin}° Kelvin');
      break;
    case 3:
      print('${converter.celsius}° Celsius sama dengan ${converter.reaumur}° Reaumur');
      break;
    default:
      print('invalid');
  }
}
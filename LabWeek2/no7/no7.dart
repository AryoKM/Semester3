import 'dart:io'; import 'no7(2).dart';

main() {
  print('masukkan jenis kendaraan yang ingin dinilai kecepatannya (masukkan "mobil" atau "motor")');
  String? choice = stdin.readLineSync()?.toLowerCase();

  stdout.write('masukkan kecepatan kendaraan (km/h): ');
  int speed = int.parse(stdin.readLineSync()!);

  Vehicle? vehicle;

  if (choice == 'mobil') {
    vehicle = mobil(speed);
  } else if (choice == 'motor') {
    vehicle = motor(speed);
  } else {
    print('invalid, masukkan mobil atau motor');
    return;
  }

  vehicle.move();
}
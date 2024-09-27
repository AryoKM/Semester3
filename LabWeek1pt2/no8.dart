import 'dart:io';

main() {
  const double konsumsiAC = 1.5;
  const double konsumsiTV = 0.2;
  const double konsumsiLampu = 0.1;  // kWh per jam

  stdout.write("input jumlah jam AC menyala: "); int? jamAC = int.parse(stdin.readLineSync()!);
  stdout.write("input jumlah jam TV menyala: "); int? jamTV = int.parse(stdin.readLineSync()!);
  stdout.write("input jumlah jam lampu menyala: "); int? jamLampu = int.parse(stdin.readLineSync()!);

  double totalKonsumsiAC = konsumsiAC * jamAC;
  double totalKonsumsiTV = konsumsiTV * jamTV;
  double totalKonsumsiLampu = konsumsiLampu * jamLampu;

  double totalharian = totalKonsumsiAC + totalKonsumsiTV + totalKonsumsiLampu;

  print("total konsumsi energi harian: $totalharian kWh");
}

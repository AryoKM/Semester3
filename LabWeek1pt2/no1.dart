import 'dart:io';

main() {
  const int hargaA = 5000; const int hargaJ = 4000;

  stdout.write("apel yang dibeli (jumlah kg): "); int? jumlahapel = int.parse(stdin.readLineSync()!);
  stdout.write("jeruk yang dibeli (jumlah kg): "); int? jumlahjeruk = int.parse(stdin.readLineSync()!);

  int totalHapel = jumlahapel * hargaA;
  int totalHjeruk = jumlahjeruk * hargaJ;
  int totalharga = totalHapel + totalHjeruk;

  print("total harga: Rp $totalharga");
}

import 'dart:io';

void main() {

  stdout.write("Masukkan jumlah produksi per jam: "); int produksiPerJam = int.parse(stdin.readLineSync()!);
  stdout.write("Masukkan jumlah jam kerja per hari: "); int jamKerjaPerHari = int.parse(stdin.readLineSync()!);
  stdout.write("Masukkan jumlah hari kerja dalam satu minggu: "); int hariKerjaPerMinggu = int.parse(stdin.readLineSync()!);

  int produksiPerHari = produksiPerJam * jamKerjaPerHari;
  int produksiPerMinggu = produksiPerHari * hariKerjaPerMinggu;

  print("Total unit barang yang dihasilkan dalam satu minggu: $produksiPerMinggu unit");
}

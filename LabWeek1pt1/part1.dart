import 'dart:io'; import 'dart:math'; import 'pyramid.dart';

main() {
  var random = Random();

  stdout.write('\nmasukkan berapa angka random yg mau di generate: ');
  int? count = int.tryParse(stdin.readLineSync()!);

  (count != null && count > 0) ? menu(random, count) : print('invalid');
}

rendom(Random random, int count, List<int> angka) {
  angka.add(random.nextInt(100));
  count > 1 ? rendom(random, count - 1, angka) : print('\nangka random: $angka');
}

menu(Random random, int count) {
  List<int> angka = [];
  rendom(random, count, angka);

  print('\npilih opsi\n1. bubble sort\n2. inverse\n3. shuffle\n');
  stdout.write('masukkan pilihan: ');

  String? opsi = stdin.readLineSync();

  switch (opsi) {
    case '1': angka = sort(angka); print('\nhasil bubble sort: $angka\n'); break;
    case '2': angka = inverse(angka); print('\nhasil inverse: $angka\n'); break;
    case '3': angka.shuffle(); print('\nhasil shuffle: $angka\n'); break; // shuffle biasa

    default: print('\ninvalid\n'); break;
  }

  stdout.write('tampilkan hasil dalam bentuk piramida? (y/n): ');
  String? pyramidOption = stdin.readLineSync();
  pyramidOption?.toLowerCase() == 'y' ? piramid(angka) : null;
}

List<int> sort(List<int> angka) {
  int i = 0;
  while (i < angka.length - 1) {
    if (angka[i] > angka[i + 1]) {int temp = angka[i]; angka[i] = angka[i + 1]; angka[i + 1] = temp;
      i = 0; // pertama bubble sort mengecek jika pasangan kiri lebih besar dari pasangan kanan, jika ia, maka terjadi pertukaran
    } else {
      i++; // kalau tidak ada pertukaran, mulai ulang pengecekan setelah pertukaran
    }
  }
  return angka;
}

List<int> inverse(List<int> angka) {return List.from(angka.reversed);} // inverse biasa
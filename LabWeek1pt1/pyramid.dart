import 'dart:io'; import 'dart:math';

piramid(List<int> angka) {
  int rows = (sqrt(angka.length)).ceil(); // yahhh pakai square root 💀 ini saja harus pisah file gegara masih ada while sama if
  int index = 0; // inisialisasikan index

  printRow(int i) {int spaces = rows - i;
  stdout.write('  ' * spaces);

    int j = 0;
    while (j < i && index < angka.length) { // pastikan jumlah angka yang benar dicetak pada baris saat ini (sama dengan nomor baris) dan memastikan tidak melampaui batas daftar
      stdout.write('${angka[index]} '); index++; j++;} // pastikan tidak out of bounds

    print('');
    if (i < rows) {printRow(i + 1);}} // mengecek jika row saat ini kurang dari total row, kalau true, printRow di panggil secara recursive dengan row angka berikut (i + 1)
  printRow(1); // print dari row 1
}

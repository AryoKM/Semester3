import 'dart:io'; import 'dart:math';

main() {
  var random = Random();

  stdout.write('\nmasukkan berapa angka random yg mau di generate: ');
  int? count = int.tryParse(stdin.readLineSync()!);

  (count != null && count > 0)
      ? menu(random, count) : print('invalid');
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
    case '1':
      angka = sort(angka);
      print('\nhasil bubble sort: $angka\n');
      break;
    case '2':
      angka = inverse(angka);
      print('\nhasil inverse: $angka\n');
      break;
    case '3':
      angka.shuffle(); // method shuffle biasa
      print('\nhasil shuffle: $angka\n');
      break;

    default:
      print('\ninvalid\n');
      break;
  }
}

List<int> sort(List<int> angka) {
  bool michaelbuble = true;
  while (michaelbuble) {
    michaelbuble = false;
    int i = 0;
    while (i < angka.length - 1) {
      if (angka[i] > angka[i + 1]) { int temp = angka[i]; angka[i] = angka[i + 1]; angka[i + 1] = temp; michaelbuble = true; } i++;
    }
  }
  return angka;
}

List<int> inverse(List<int> angka) {
  return List.from(angka.reversed);
}

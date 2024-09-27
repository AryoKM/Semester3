import 'dart:io';

main() {
  stdout.write("masukkan uang harian: ");
  int uangharian = int.parse(stdin.readLineSync()!);
  
  int totaluang = uangharian * 30; //soalnya suruh cmn 30 hari

  print("total uang di celengan setelah 30 hari adalah Rp $totaluang");
}
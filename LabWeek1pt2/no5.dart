import 'dart:io';

main() {
  const int tarifawal = 2000;
  const int tarifdlc = 1000;
  
  stdout.write("masukkan jumlah jam parkir: ");
  int? jamparkir = int.parse(stdin.readLineSync()!);

  int total;
  
  if (jamparkir <= 2) { total = jamparkir * tarifawal; }
  else { total = (2 * tarifawal) + ((jamparkir - 2) * tarifdlc); }

  print("total biaya parkir Rp $total");
}

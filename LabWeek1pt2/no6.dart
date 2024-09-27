import 'dart:io';

main() {
  const int gaji = 4000000;
  const int bonus = 200000;
  
  stdout.write("masukkan jumlah jam kerja per minggu: ");
  int? jamkerja = int.parse(stdin.readLineSync()!);
  
  int totalgaji;
  
  if (jamkerja > 40) { totalgaji = gaji + bonus; } else { totalgaji = gaji; };
  
  print("total gajii yang di terima: Rp $totalgaji");
}

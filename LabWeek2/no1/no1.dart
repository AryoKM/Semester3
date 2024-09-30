import 'dart:io'; import 'no1(2).dart';

main() {
  stdout.write('masukkan nama siswa: ');
  String nama = stdin.readLineSync()!;
  
  stdout.write('masukkan ID siswa: ');
  int IDsiswa;
  try { IDsiswa = int.parse(stdin.readLineSync()!); } catch (e) { print('error, ID siswa invalid'); return; }
  
  stdout.write('masukkan nilai siswa: ');
  double nilai;
  try { nilai = double.parse(stdin.readLineSync()!); } catch (e) { print('error, nilai invalid'); return; }

  Siswa student1 = Siswa(nama, IDsiswa, nilai);

  student1.present();

  if (student1.lulus()) { 
    print('\nnilai di atas 70, siswa ini lulus'); 
  } else { 
    print('\nnilai di bawah 70, siswa ini tidak lulus'); 
  }
}
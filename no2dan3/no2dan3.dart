import 'dart:io'; import 'no2dan3(2).dart';

main() {
  stdout.write('Masukkan saldo awal untuk BankAccount: ');
  double initialBalance = double.parse(stdin.readLineSync()!);

  SavingsAccount myAccount = SavingsAccount(initialBalance, 5.0);

  while (true) {
    print('\nPilih opsi:');
    print('1. Setor uang');
    print('2. Tarik uang');
    print('3. Cek saldo');
    print('4. Terapkan bunga');
    print('5. Keluar');
    stdout.write('Masukkan pilihan anda: ');
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        stdout.write('Masukkan jumlah yang ingin disetor: ');
        double depositAmount = double.parse(stdin.readLineSync()!);
        myAccount.deposit(depositAmount);
        break;
      case 2:
        stdout.write('Masukkan jumlah yang ingin ditarik: ');
        double withdrawAmount = double.parse(stdin.readLineSync()!);
        myAccount.withdraw(withdrawAmount);
        break;
      case 3:
        myAccount.checkBalance();
        break;
      case 4:
        myAccount.applyInterest();
        break;
      case 5:
        print('Terima kasih telah menggunakan layanan kami.');
        return;
      default:
        print('Pilihan tidak valid, coba lagi.');
    }
  }
}
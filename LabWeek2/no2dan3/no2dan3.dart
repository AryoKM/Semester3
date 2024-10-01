import 'dart:io'; import 'no2dan3(2).dart';

main() {
  stdout.write('Masukkan saldo awal untuk BankAccount: ');
  double initialBalance = double.parse(stdin.readLineSync()!);

  SavingsAccount myAccount = SavingsAccount(initialBalance, 5.0);

  while (true) {
    print('\npilih opsi:1. setonr uang\n2. tarik uang\n3. cek saldo\n4. terapkan bunga\n5. keluar');
    stdout.write('masukkan pilihan anda: ');
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        stdout.write('masukkan jumlah yang ingin disetor: ');
        double depositAmount = double.parse(stdin.readLineSync()!);
        myAccount.deposit(depositAmount);
        break;
      case 2:
        stdout.write('masukkan jumlah yang ingin ditarik: ');
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
        print('exit');
        return;
      default:
        print('invalid');
    }
  }
}
class BankAccount {
  double _balance;

  BankAccount(double initialBalance) : _balance = initialBalance;

  deposit(double amount) {
    if (amount >= 50000) {
      _balance += amount;
      print('Berhasil disetor: Rp ${amount}');
    } else {
      print('Jumlah setoran minimal adalah Rp 50000');
    }
  }

  withdraw(double amount) {
    if (amount >= 50000 && amount <= _balance) {
      _balance -= amount;
      print('Berhasil ditarik: Rp ${amount}');
    } else if (amount < 50000) {
      print('Jumlah penarikan minimal adalah Rp 50000');
    } else {
      print('Jumlah penarikan tidak valid');
    }
  }

  checkBalance() {
    print('Saldo anda saat ini: Rp ${_balance}');
  }
}

class SavingsAccount extends BankAccount {
  double interestRate;

  SavingsAccount(double initialBalance, this.interestRate) : super(initialBalance);

  applyInterest() {
    double interest = _balance * interestRate / 100;
    deposit(interest);
    print('Bunga sebesar Rp ${interest} telah diterapkan');
  }
}
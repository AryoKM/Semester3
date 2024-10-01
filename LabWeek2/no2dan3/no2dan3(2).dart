class BankAccount {
  double _balance;

  BankAccount(double initialBalance) : _balance = initialBalance;

  deposit(double amount) {
    if (amount >= 50000) {
      _balance += amount;
      print('uang sebesar Rp ${amount} berhasil disetor');
    } else {
      print('jumlah setoran minimal 50000');
    }
  }

  withdraw(double amount) {
    if (amount >= 50000 && amount <= _balance) {
      _balance -= amount;
      print('berhasil ditarik: Rp ${amount}');
    } else if (amount < 50000) {
      print('jumlah penarikan minimal Rp 50000');
    } else {
      print('invalid');
    }
  }

  checkBalance() {
    print('saldo anda saat ini: Rp ${_balance}');
  }
}

class SavingsAccount extends BankAccount {
  double interestRate;

  SavingsAccount(double initialBalance, this.interestRate) : super(initialBalance);

  applyInterest() {
    double interest = _balance * interestRate / 100;
    deposit(interest);
    print('diterapkan bunga sebesar Rp ${interest}');
  }
}
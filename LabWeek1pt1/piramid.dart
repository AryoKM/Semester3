import 'dart:io';

main(List<String> args) {
  stdout.write('Enter the size of the pyramid: ');
  int n = int.parse(stdin.readLineSync()!);
  int i = 1;
  while (i <= n) {
    int j = 1;
    while (j <= n - i) {
      stdout.write(' ');
      j++;
    }
    j = 1;
    while (j <= 2 * i - 1) {
      stdout.write('*');
      j++;
    }
    print('');
    i++;
  }
}


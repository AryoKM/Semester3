import 'dart:io'; import 'no4(2).dart'; import 'no4(3).dart';
main() {
  Library library = Library();
  while (true) {
    print('1. tambah buku\n2. hapus buku\n3. display buku\n4. exit');
    stdout.write('masukkan pilihan: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter title: ');
        String? title = stdin.readLineSync();
        stdout.write('Enter author: ');
        String? author = stdin.readLineSync();
        stdout.write('Enter year: ');
        int? year = int.tryParse(stdin.readLineSync() ?? '');
        if (title != null && author != null && year != null) {
          library.addBook(Book(title, author, year));
        } else {
          print('invalid');
        }
        break;
      case '2':
        stdout.write('masukkan judul buku yang mau di remove: ');
        String? title = stdin.readLineSync();
        if (title != null) {
          library.removeBook(title);
        } else {
          print('invalid');
        }
        break;
      case '3':
        library.displayBooks();
        break;
      case '4':
        exit(0);
      default:
        print('invalid');
    }
  }
}
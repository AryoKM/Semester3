import 'no4(2).dart';

class Library {
  List<Book> books = [];

  addBook(Book book) {
    books.add(book);
  }

  removeBook(String title) {
    books.removeWhere((book) => book.title == title);
  }

  displayBooks() {
    for (var book in books) {
      print('Title: ${book.title}, Author: ${book.author}, Year: ${book.year}');
    }
  }
}
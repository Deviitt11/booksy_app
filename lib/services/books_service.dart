import 'package:booksy_app/model/book.dart';

class BooksService {

  static const List<Book> books = [
    Book(
      1,
      "Tim – The Official Biography of Avicii",
      "Mans Mosesson",
      "The intimate biography of the iconic DJ who was lost too soon.",
      "assets/images/avicii.jpg",
    ),
    Book(
      2,
      "Building the Yellow Wall: The Incredible Rise and Cult Appeal of Borussia Dortmund",
      "Uli Hesse",
      "Every fortnight, an incredible number of foreigners travel to Dortmund to watch football",
      "assets/images/bvb.jpg",
    ),
    Book(
      3,
      "The Maze Runner",
      "James Dashner",
      "Book one in the blockbuster Maze Runner series that spawned a movie franchise and ushered in a worldwide phenomenon!",
      "assets/images/mr.jpg",
    ),
  ];

  Future<List<Book>> getLastBook() async {
    // var books = await api.getBooks();
    return Future.delayed(const Duration(seconds: 3))
        .then((value) => Future.value(books.sublist(0,3)));
  }
  
  Future<Book> getBook(int bookId) async {
    return Future.delayed(const Duration(seconds: 3))
        .then((value) => Future.value(
        books.firstWhere((bookElement) => bookElement.id == bookId)));
  }
}
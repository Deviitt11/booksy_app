import 'package:booksy_app/model/book.dart';
import 'package:booksy_app/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookshelfScreen extends StatelessWidget {
  const BookshelfScreen({Key? key}) : super(key: key);

  final List<Book> _books = const [
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookshelfBloc, BookshelfState>(
      builder: (context, bookshelfState) {
        if (bookshelfState.bookIds.isEmpty) {
          return Center(
            child: Text(
              "No tienes ningún libro en tu estante",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          );
        }

        return Container(
          margin: const EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: bookshelfState.bookIds.length,
            itemBuilder: (context, index) {
              return BookCoverItem(bookshelfState.bookIds[index]);
            },
          ),
        );
      },
    );
  }
}

class BookCoverItem extends StatelessWidget {
  final int _bookId;

  const BookCoverItem(this._bookId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Libro id: $_bookId");
    /*
      InkWell(
      onTap: () {},
      child: Ink.image(fit: BoxFit.fill, image: AssetImage(_book.coverUrl)),

     */
  }
}

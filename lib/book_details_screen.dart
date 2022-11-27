import 'package:assignment_4/book/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({Key? key, required this.book}) : super(key: key);
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
                backgroundImage: book.url.toString().substring(0, 4) == 'http'
                    ? NetworkImage(book.url)
                    : null),
            Text(book.bookName),
            Text(book.author),
            Text(book.publisherName),
            Text(book.ISBN),
            Icon(
              Icons.favorite,
              color: book.isFavorite ? Colors.red : Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

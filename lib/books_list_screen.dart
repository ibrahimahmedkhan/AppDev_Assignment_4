import 'package:assignment_4/book/book_list_tile_widget.dart';
import 'package:assignment_4/book/book_provider.dart';
import 'package:assignment_4/book_details_screen.dart';
import 'package:assignment_4/counter/counter_provider.dart';
import 'package:assignment_4/new_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksListScreen extends StatefulWidget {
  const BooksListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BooksListScreen> createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {
  @override
  void initState() {
    super.initState();

    context.read<CounterProvider>().fetchCounters();
    context.read<BookProvider>().fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: context
              .watch<BookProvider>()
              .books
              .map((book) => BookListTile(
                  book: book,
                  onTap: (book) => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BookDetailsScreen(book: book)))))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {});
          await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NewBookScreen()));
          setState(() {
            context.read<BookProvider>().fetchBooks();
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:assignment_4/book/book_provider.dart';
import 'package:assignment_4/book/book_widget.dart';
import 'package:assignment_4/counter/counter_provider.dart';
import 'package:assignment_4/new_book_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksListScren extends StatefulWidget {
  const BooksListScren({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BooksListScren> createState() => _BooksListScrenState();
}

class _BooksListScrenState extends State<BooksListScren> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<CounterProvider>().fetchCounters();
    context.read<BookProvider>().fetchBooks();
  }

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('books').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BookWidget(
            books: context.watch<BookProvider>().books,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NewBookScreen()))),
        // child: UserInformation(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {});
          await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NewBookScreen()));
          setState(() {
            context.read<BookProvider>().fetchBooks();
          });
        }
        // context.read<CounterProvider>().increment(),
        ,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

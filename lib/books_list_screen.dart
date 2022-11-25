import 'package:assignment_4/book/book_provider.dart';
import 'package:assignment_4/book/book_widget.dart';
import 'package:assignment_4/counter/counter_provider.dart';
import 'package:assignment_4/new_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<CounterProvider>().fetchCounters();
    context.read<BookProvider>().fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: BookWidget(books: context.watch<BookProvider>().books),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NewBookScreen()))
        }
        // context.read<CounterProvider>().increment(),
        ,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

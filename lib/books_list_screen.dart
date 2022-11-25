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
        // child: UserInformation(),
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

//////////////////////////////////////////////////////////////
class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('books').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs
              .map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['name']),
                  subtitle: Text(data['author']),
                );
              })
              .toList()
              .cast(),
        );
      },
    );
  }
}

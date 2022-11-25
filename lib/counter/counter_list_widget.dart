import 'package:assignment_4/counter/counter.dart';
import 'package:flutter/material.dart';

class CounterListWidget extends StatelessWidget {
  const CounterListWidget({Key? key, required this.counters}) : super(key: key);
  final List<Counter> counters;
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: counters
            .map((counter) => ListTile(
                  leading: Text(counter.count.toString()),
                ))
            .toList());
  }
}

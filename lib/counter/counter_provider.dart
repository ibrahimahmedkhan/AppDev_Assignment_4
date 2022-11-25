import 'package:assignment_4/counter/counter_repository.dart';
import 'package:flutter/material.dart';

import 'counter.dart';

class CounterProvider with ChangeNotifier {
  // final Counter _counter = Counter(count: 10);
  //
  // int get count => _counter.count;
  //
  // void increment() {
  //   _counter.count++;
  //   notifyListeners();
  // }

  List<Counter> counters = [];

  // bool isCountersFetching = false;

  final CounterRepository _counterRepository = MockCounterRepository();

  void fetchCounters() async {
    // isCountersFetching = true;
    // notifyListeners();
    counters = await _counterRepository.fetchCountersList();
    // isCountersFetching = false;
    notifyListeners();
  }
}

import 'counter.dart';

abstract class CounterRepository {
  Future<List<Counter>> fetchCountersList();
}

class MockCounterRepository implements CounterRepository {
  @override
  Future<List<Counter>> fetchCountersList() async {
    List<Counter> users = [
      Counter(count: 12),
      Counter(count: 12),
      Counter(count: 23),
      Counter(count: 1221),
    ];
    return users;
  }
}

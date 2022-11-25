class Counter {
  int count;

  Counter({required this.count});

  static Counter fromJson(Map<String, dynamic> json, String id) =>
      Counter(count: json['count'] as int);
}

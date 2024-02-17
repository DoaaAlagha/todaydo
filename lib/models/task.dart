import 'dart:convert';

class Task {
  final String name;
  bool isDone;
  Task({
    required this.name,
    required this.isDone,
  });

  Task copyWith({
    String? name,
    bool? isDone,
  }) {
    return Task(
      name: name ?? this.name,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isDone': isDone,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'] ?? '',
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() => 'Task(name: $name, isDone: $isDone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task && other.name == name && other.isDone == isDone;
  }

  @override
  int get hashCode => name.hashCode ^ isDone.hashCode;
}

// ignore_for_file: file_names, unnecessary_new

class Person {
  final int? id;
  final String name;
  final String department;

  Person({this.id, required this.name, required this.department});

  factory Person.fromMap(Map<String, dynamic> json) => new Person(
        id: json['id'],
        name: json['name'],
        department: json['department'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'department': department,
    };
  }
}

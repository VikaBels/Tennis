// ignore_for_file: file_names, unnecessary_new

class Department {
  final int? id;
  final String department;

  Department({this.id, required this.department});

  factory Department.fromMap(Map<String, dynamic> json) => new Department(
        id: json['id'],
        department: json['department'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'department': department,
    };
  }
}

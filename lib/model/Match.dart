// ignore_for_file: file_names, unnecessary_new, non_constant_identifier_names

class Match {
  final int? id;
  final int time;
  final int point_one;
  final int point_two;
  final int id_one;
  final int id_two;
  final int? id_three;
  final int? id_four;

  Match({
    required this.id,
    required this.time,
    required this.point_one,
    required this.point_two,
    required this.id_one,
    required this.id_two,
    this.id_three,
    this.id_four,
  });

  factory Match.fromMap(Map<String, dynamic> json) => new Match(
        id: json['id'],
        time: json['time'],
        point_one: json['point_one'],
        point_two: json['point_two'],
        id_one: json['id_one'],
        id_two: json['id_two'],
        id_three: json['id_three'],
        id_four: json['id_four'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time,
      'point_one': point_one,
      'point_two': point_two,
      'id_one': id_one,
      'id_two': id_two,
      'id_three': id_three,
      'id_four': id_four,
    };
  }
}

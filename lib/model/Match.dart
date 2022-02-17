// ignore_for_file: file_names, unnecessary_new

class Match {
  final int? id;
  final String time;
  final String points;

  Match({this.id, required this.time, required this.points});

  factory Match.fromMap(Map<String, dynamic> json) => new Match(
        id: json['id'],
        time: json['time'],
        points: json['points'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time,
      'points': points,
    };
  }
}

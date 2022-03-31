// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_new

class AboutOneM {
  String first_player;
  String second_player;
  String? third_player;
  String? fourth_player;
  int point_one;
  int point_two;
  String time;

  AboutOneM({
    required this.first_player,
    required this.second_player,
    this.third_player,
    this.fourth_player,
    required this.point_one,
    required this.point_two,
    required this.time,
  });

  factory AboutOneM.fromMap(Map<String, dynamic> json) => new AboutOneM(
        first_player: json['first_player'],
        second_player: json['second_player'],
        third_player: json['third_player'],
        fourth_player: json['fourth_player'],
        point_one: json['point_one'],
        point_two: json['point_two'],
        time: json['time'],
      );
}

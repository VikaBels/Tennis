// ignore_for_file: file_names, unnecessary_new
class Player {
  int? id;
  String? name;
  String? department;

  Player({this.id, this.name, this.department});

  bool checkIfAnyIsNull() {
    return [name, department].contains(null);
  }

  static List<Player> players = [];
}

// ignore_for_file: file_names, unnecessary_new
class Player {
  String? name;
  String? department;

  Player({this.name, this.department});

  bool checkIfAnyIsNull() {
    return [name, department].contains(null);
  }
}

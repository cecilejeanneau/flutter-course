enum CartoonType { Comedy, Drama, Dummy, Horror }

class Cartoon {
  String name = "";
  int duration = 0;
  CartoonType type = CartoonType.Comedy;

  Cartoon({required this.name,
    required this.duration,
    this.type = CartoonType.Comedy});

  Cartoon.fromJSON(Map<String, dynamic> json) {
    name = json['name'];
    duration = json['duration'];
    type = json['type'];
  }

  @override
  String toString() {
    return 'Cartoon{name: $name, duration: $duration, type: $type}';
  }

  set setDuration(int duration) {
    this.duration = duration;
  }

  int get getDuration {
    return duration;
  }
}

Cartoon shrek = Cartoon(name: "Shrek", duration: 120);

void main() {
  Cartoon shrek = Cartoon(name: "Shrek", duration: 120);
  print(shrek.toString());
  shrek.duration = 150;
  print(shrek.toString());
  shrek.setDuration = 250;
  print(shrek.toString());

  Cartoon mulan = Cartoon.fromJSON(
      {
        "name": "Mulan",
        "duration": 120,
        "type": CartoonType.Drama
      }
  );

  print(mulan.toString());
}

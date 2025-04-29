class Course {
  String name;
  List<double> notes;

  Course({required this.name, required this.notes});
}

void main() {
  List<Course> courses = [
    Course(name: "Informatique", notes: [15, 18, 20, 20, 16, 0]),
    Course(name: "Français", notes: [5, 8, 0, 0, 16, 10]),
  ];

  getAverage(Course course) {
    print(
        "La moyenne de ${course.name} est de : "
            "${course.notes.reduce((value, element) => value + element) / course.notes.length}"
    );
  }

  getTotalAverage(List<Course> courses) {
    double total = 0;
    int count = 0;

    for (Course course in courses) {
      for (double note in course.notes) {
        total += note;
        count++;
      }
      getAverage(course);
    }

    return total / count;
  }

  var average = getTotalAverage(courses);
  print("La moyenne totale est de ${average.toStringAsFixed(2)}");
}

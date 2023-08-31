class Course{
  String Judul;
  String Deskripsi;

  Course(this.Judul, this.Deskripsi);

}

class Student{
  String Nama;
  String Kelas;
  List<Course> courses = [];

  Student(this.Nama, this.Kelas, );

  void addCourse (Course course){
    courses.add(course);
  }

  void RemoveCourse (Course course){
    courses.remove(course);
  }

  void viewCourses() {
    if (courses.isEmpty) {
      print("$Nama belum menambahkan Course");
    } else {
      print("Courses $Nama $Kelas:");
      for (var course in courses) {
        print("- ${course.Judul}: ${course.Deskripsi}");
      }
    }
  }
}

  void main () {
  Course Flutter = Course("Flutter", "Complete Front-End Engineer Career with Flutter");
  Course Java = Course("Java", "Complete Java Engineer Career with Java");

  Student agung = Student("Agung", "Reguler A");
  Student aldi = Student("Aldi", "Reguler B");

  agung.addCourse(Flutter);
  agung.addCourse(Java);
  agung.viewCourses();
  aldi.addCourse(Java);
  aldi.viewCourses();
  agung.RemoveCourse(Flutter);
  agung.viewCourses();
}
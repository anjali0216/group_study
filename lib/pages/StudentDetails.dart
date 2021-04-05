class StudentDetails {
  String name;
  String course;
  String username;
  String email;
  String password;
  StudentDetails({this.name, this.course,this.username, this.email, this.password});

  factory StudentDetails.fromJson(Map<String, dynamic> json){
    return StudentDetails(name: json['name'],
      course: json['course'],
      username: json['username'],
      email: json['email'],
      password: json['password'],);
  }
}
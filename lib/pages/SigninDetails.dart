class SigninDetails {
  String name;
  String username;
  String email;
  String course;
  String password;
  SigninDetails({this.name,this.username,this.email,this.course, this.password});

  factory SigninDetails.fromJson(Map<String, dynamic> json){
    return SigninDetails(name: json['name'],
      username: json['username'],
      email: json['email'],
      course: json['course'],
      password: json['password'],
    );}
}
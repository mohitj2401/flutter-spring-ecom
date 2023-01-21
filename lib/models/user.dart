class User {
  String? username;
  String? email;
  String? name;
  // User({required this.email, required this.name, required this.username});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    email = json['email'];
  }
}

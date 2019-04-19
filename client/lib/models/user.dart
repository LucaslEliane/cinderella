import 'dart:convert';

User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromJson(jsonData);
}

String userToJson(User user) {
  final dyn = user.toJson();
  return json.encode(dyn);
}

class User {
  int id;
  String userName;
  bool blocked;

  User({
    this.id,
    this.userName,
    this.blocked
  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
    id: json["id"],
    userName: json["user_name"],
    blocked: json["blocked"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_name": userName,
    "blocked": blocked
  };
}

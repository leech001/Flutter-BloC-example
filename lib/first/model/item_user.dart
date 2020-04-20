import 'dart:convert';

ItemUser itemUserFromJson(String str) => ItemUser.fromJson(json.decode(str));

String itemUserToJson(ItemUser data) => json.encode(data.toJson());

class ItemUser {
  int postId;
  int id;
  String name;
  String email;
  String body;

  ItemUser({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory ItemUser.fromJson(Map<String, dynamic> json) => ItemUser(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}

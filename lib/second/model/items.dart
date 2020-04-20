import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  int userId;
  int id;
  String title;
  bool completed;

  Item({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}

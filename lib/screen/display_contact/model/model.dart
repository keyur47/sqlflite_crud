import 'dart:convert';

TaskModel taskDataFromJson(String str) {
  final jsonData = json.decode(str);
  return TaskModel.fromMap(jsonData);
}

String taskDataToJson(TaskModel data) {
  final dm = data.toMap();
  return json.encode(dm);
}

class TaskModel {
  int? id;
  String? name;
  String? contact;
  String? address;

  static final columns = ["id", "name", "contact", "address"];

  TaskModel({this.id, this.name, this.contact, this.address});

  factory TaskModel.fromMap(Map<dynamic, dynamic> json) => TaskModel(
      id: json["id"],
      name: json["name"],
      contact: json["contact"],
      address: json["address"]);

  Map<String, dynamic> toMap() =>
      {"id": id, "name": name, "contact": contact, "address": address};
}

import 'dart:core';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.surname,
    this.nickname,
    this.password,
    this.mail,
    this.createdDate,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    surname = json['surname'] as String?;
    nickname = json['nickname'] as String?;
    password = json['password'] as String?;
    mail = json['mail'] as String?;
    createdDate = json['created_date'] as DateTime?;
  }

  int? id;
  String? name;
  String? surname;
  String? nickname;
  String? password;
  String? mail;
  DateTime? createdDate;
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'nickname': nickname,
      'password': password,
      'mail': mail,
      'created_date': createdDate,
    };
  }
}

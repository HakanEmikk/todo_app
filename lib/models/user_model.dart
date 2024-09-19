import 'dart:core';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.surname,
    this.nickname,
    this.password,
    this.mail,
    this.key,
    this.createdDate,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    surname = json['surname'] as String?;
    nickname = json['nickname'] as String?;
    password = json['password'] as String?;
    mail = json['mail'] as String?;
    key = json['key'] as String?;
    createdDate = json['created_date'] as DateTime?;
  }

  int? id;
  String? name;
  String? surname;
  String? nickname;
  String? password;
  String? mail;
  DateTime? createdDate;
  String? key;

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (surname != null) 'surname': surname,
      if (nickname != null) 'nickname': nickname,
      if (password != null) 'password': password,
      if (mail != null) 'mail': mail,
      if (createdDate != null) 'created_date': createdDate,
      if (key != null) 'key': key
    };
  }
}

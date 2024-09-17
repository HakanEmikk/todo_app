import 'dart:core';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.nickname,
    required this.password,
    required this.mail,
  });

  int? id;
  String? name;
  String? surname;
  String? nickname;
  String? password;
  String? mail;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    nickname = json['nickname'];
    password = json['password'];
    mail = json['mail'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'nickname': nickname,
      'password': password,
      'mail': mail,
    };
  }
}

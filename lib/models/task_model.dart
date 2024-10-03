class TaskModel {
  TaskModel({
    this.explation,
    this.date,
    this.status,
    this.userId,
    this.id,
    this.categoryId,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    explation = json['explation'] as String;

    date = json['date'] as String?;
    status = json['status'] as String?;
    userId = json['user_id'] as int?;
    id = json['id'] as int?;
    categoryId = json['category_id'] as int?;
  }
  String? explation;

  String? date;
  String? status;
  int? userId;
  int? id;
  int? categoryId;

  Map<String, dynamic> toJson() {
    return {
      'explation': explation,
      'date': date,
      'status': status,
      'user_id': userId,
      'id': id,
      'category_id': categoryId,
    };
  }
}

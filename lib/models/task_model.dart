class TaskModel {
  TaskModel({
    this.explation,
    this.category,
    this.date,
    this.status,
    this.userId,
    this.id,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    explation = json['explation'] as String;
    category = json['category'] as String;
    date = json['date'] as String?;
    status = json['status'] as String?;
    userId = json['user_id'] as int?;
    id = json['id'] as int?;
  }
  String? explation;
  String? category;
  String? date;
  String? status;
  int? userId;
  int? id;

  Map<String, dynamic> toJson() {
    return {
      'explation': explation,
      'category': category,
      'date': date,
      'status': status,
      'user_id': userId,
      'id': id,
    };
  }
}

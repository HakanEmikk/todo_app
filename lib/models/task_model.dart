class TaskModel {
  TaskModel({
    this.explation,
    this.category,
    this.date,
    this.status,
    this.userId,
  });

  TaskModel.fromJson(Map<dynamic, String> json) {
    explation = json['explation'];
    category = json['category'];
    date = json['date'] as DateTime?;
    status = json['status'];
    userId = json['user_id'] as int?;
  }
  String? explation;
  String? category;
  DateTime? date;
  String? status;
  int? userId;
  Map<String, dynamic> toJson() {
    return {
      'explation': explation,
      'category': category,
      'date': date,
      'status': status,
      'user_id': userId,
    };
  }
}

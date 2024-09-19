class TaskModel {
  TaskModel({
    this.explanation,
    this.category,
    this.date,
    this.status,
    this.userId,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    explanation = json['explanation'] as String;
    category = json['category'] as String;
    date = json['date'] as DateTime?;
    status = json['status'] as bool?;
    userId = json['user_id'] as int?;
  }
  String? explanation;
  String? category;
  DateTime? date;
  bool? status;
  int? userId;
  Map<String, dynamic> toJson() {
    return {
      'explation': explanation,
      'category': category,
      'date': date,
      'status': status,
      'user_id': userId,
    };
  }
}

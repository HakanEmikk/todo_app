class FileModel {
  FileModel({
    this.fileName,
    this.filePath,
    this.taskId,
  });
  FileModel.fromJson(Map<String, dynamic> json) {
    fileName = json['file_name'] as String;
    taskId = json['task_id'] as int;
    filePath = json['file_path'] as String;
  }
  int? taskId;
  String? fileName;
  String? filePath;
  Map<String, dynamic> toJson() {
    return {
      'file_name': fileName,
      'task_id': taskId,
      'file_path': filePath,
    };
  }
}

import 'package:get/get.dart';

import '../../../models/task_model.dart';

class TaskController extends GetxController {
  bool isLoading = false;
  List<TaskModel> taskList = <TaskModel>[];
  Future<void> fetchTaskList() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
  }
}

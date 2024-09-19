import 'package:get/get.dart';

import '../../../models/default_response_model.dart';
import '../../../models/task_model.dart';
import '../../../repositories/task_repository.dart';

class TaskController extends GetxController {
  RxBool isLoading = false.obs;
  List<TaskModel> taskList = <TaskModel>[];
  Future<void> fetchTaskList() async {
    final DefaultResponseModel<List<TaskModel>> response =
        await TaskRepository().listing();

    taskList = response.data!;
    if (!response.responseIsTrue!) {
      Get.showSnackbar(GetSnackBar(message: response.message));
    }
  }
}

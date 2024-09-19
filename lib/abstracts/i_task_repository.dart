import '../models/default_response_model.dart';
import '../models/task_model.dart';

abstract class ITaskRepository {
  Future<DefaultResponseModel<void>> add(TaskModel task);
  Future<DefaultResponseModel<void>> delete(TaskModel task);
  Future<DefaultResponseModel<void>> update(TaskModel task);
  Future<DefaultResponseModel<List<TaskModel>>> listing();
}

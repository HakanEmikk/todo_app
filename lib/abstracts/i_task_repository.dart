import '../models/default_response_model.dart';
import '../models/task_model.dart';

abstract class ITaskRepository {
  Future<DefaultResponseModel> add(TaskModel task);
  Future<DefaultResponseModel> delete(TaskModel task);
  Future<DefaultResponseModel> update(TaskModel task);
  Future<DefaultResponseModel> listing(TaskModel task);
}

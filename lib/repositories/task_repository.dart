import '../abstracts/i_task_repository.dart';
import '../models/default_response_model.dart';
import '../models/task_model.dart';

class TaskRepository extends ITaskRepository {
  @override
  Future<DefaultResponseModel> add(TaskModel task) {
    return Future<DefaultResponseModel>.delayed(
      const Duration(seconds: 1),
      () =>
          DefaultResponseModel(responseIsTrue: true, message: 'görev eklendi'),
    );
  }

  @override
  Future<DefaultResponseModel> delete(TaskModel task) {
    return Future<DefaultResponseModel>.delayed(
      const Duration(seconds: 1),
      () =>
          DefaultResponseModel(responseIsTrue: true, message: 'görev silindi'),
    );
  }

  @override
  Future<DefaultResponseModel> listing(TaskModel task) {
    return Future<DefaultResponseModel>.delayed(
      const Duration(seconds: 1),
      () => DefaultResponseModel(
          responseIsTrue: true, message: 'görev listelendi'),
    );
  }

  @override
  Future<DefaultResponseModel> update(TaskModel task) {
    return Future<DefaultResponseModel>.delayed(
      const Duration(seconds: 1),
      () => DefaultResponseModel(
          responseIsTrue: true, message: 'görev güncellendi'),
    );
  }
}

import 'repositories/category_repository.dart';
import 'repositories/task_repository.dart';
import 'repositories/user_repository.dart';

class AppContainer {
  AppContainer._();
  static UserRepository userRepository = UserRepository();
  static TaskRepository taskRepository = TaskRepository();
  static CategoryRepository categoryRepository = CategoryRepository();
}

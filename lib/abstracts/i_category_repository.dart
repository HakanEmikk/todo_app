import '../models/category_model.dart';
import '../models/default_response_model.dart';

abstract class ICategoryRepository {
  Future<DefaultResponseModel<void>> add(CategoryModel category);
  Future<DefaultResponseModel<List<CategoryModel>>> get();
}

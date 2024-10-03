class CategoryModel {
  CategoryModel({
    this.catergoryName,
    this.id,
  });
  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    catergoryName = json['category_name'] as String;
  }
  int? id;
  String? catergoryName;
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_name': catergoryName,
    };
  }
}

class DefaultResponseModel<T> {
  DefaultResponseModel({
    required this.responseIsTrue,
    required this.message,
    this.data,
  });

  DefaultResponseModel.fromJson(Map<String, dynamic> json) {
    responseIsTrue = json['result'] as bool;
    message = json['message'] as String;
    data = json['data'] as T;
  }
  bool? responseIsTrue;
  String? message;
  T? data;
}

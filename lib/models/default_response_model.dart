class DefaultResponseModel<T> {
  DefaultResponseModel({required this.message, this.data, this.token});

  DefaultResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String;
    data = json['data'] as T;
    token = json['token'] as String;
  }

  String? message;
  T? data;
  String? token;
}

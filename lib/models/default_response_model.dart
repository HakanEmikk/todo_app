class DefaultResponseModel {
  DefaultResponseModel({
    required this.responseIsTrue,
    required this.message,
    this.data,
  });
  bool responseIsTrue;
  String message;
  dynamic data;
}

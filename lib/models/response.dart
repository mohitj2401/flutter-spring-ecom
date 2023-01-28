class ResponseModel {
  int? statusCode;
  String? message;
  Object? output;

  ResponseModel(
      {required this.message, required this.output, required this.statusCode});
}

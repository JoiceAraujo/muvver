class Endpoint {
  final String path;
  final dynamic data;
  final String method;
  final String? contentType;

  Endpoint({
    this.data,
    this.contentType,
    required this.path,
    required this.method,
  });
}

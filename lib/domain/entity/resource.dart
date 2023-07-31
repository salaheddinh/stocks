class Resource<T extends Object> {
  final T? data;
  final String? error;

  const Resource(
      {required this.data, required this.error});
}

class SuccessResource<T extends Object> extends Resource<T> {
  const SuccessResource(T data) : super(data: data, error: null);
}

class ErrorResource<T extends Object> extends Resource<T> {
  const ErrorResource(String error) : super(data: null, error: error);
}
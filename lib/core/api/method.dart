enum Method { get, post, put, delete, patch }

String methodToString(Method method) {
  switch (method) {
    case Method.get:
      return 'GET';
    case Method.post:
      return 'POST';
    case Method.put:
      return 'PUT';
    case Method.delete:
      return 'DELETE';
    case Method.patch:
      return 'PATCH';
  }
}

class HttpException implements Exception {
  static String exceptionMessage =
      "could not get data from API, please try again later or contact with developer";
  @override
  String toString() {
    return exceptionMessage;
  }
}

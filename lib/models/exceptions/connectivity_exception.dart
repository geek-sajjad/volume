class ConnectivityException implements Exception{
  static String exceptionMessage = "check internet connection";
  @override
  String toString() {
    return exceptionMessage;
  }
}
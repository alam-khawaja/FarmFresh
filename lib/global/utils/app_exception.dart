class AppException implements Exception {
  const AppException(this.title, this.message);

  final String message;
  final String title;
}

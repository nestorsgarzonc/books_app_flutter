class Failure {
  final String message;

  const Failure({this.message = 'An error has occurred'});

  @override
  String toString() => message;
}

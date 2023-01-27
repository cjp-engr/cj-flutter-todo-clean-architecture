// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class GeneralFailure extends Failure {
  final String message;
  GeneralFailure({
    required this.message,
  });
}

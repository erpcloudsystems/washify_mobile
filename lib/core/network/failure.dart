import 'package:equatable/equatable.dart';

import '../resources/strings_manager.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class OfflineFailure extends Failure {
  const OfflineFailure({
    super.errorMessage = StringsManager.offlineErrorMessage,
  });
  @override
  List<Object> get props => [errorMessage];
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure(
      {super.errorMessage = StringsManager.emptyCacheFailureMessage});
  @override
  List<Object> get props => [errorMessage];
}

class UnknownCachingFailure extends Failure {
  const UnknownCachingFailure(
      {super.errorMessage = StringsManager.unknownCachingFailureMessage});
  @override
  List<Object> get props => [errorMessage];
}

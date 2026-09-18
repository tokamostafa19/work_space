import 'package:workspace/core/taskModel.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class LoadingTasksState extends HomeState {}

class SuccessGettingTasksState extends HomeState {
  final Stream<List<TaskDataModel>> tasks;

  SuccessGettingTasksState({
    required this.tasks,
  });
}

class FailedGettingTasksState extends HomeState {
  final String errorMessage;

  FailedGettingTasksState({
    required this.errorMessage,
  });
}
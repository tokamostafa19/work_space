import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/core/fireservices.dart';
import 'package:workspace/core/taskModel.dart';
import 'homestate.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  final FirebaseServices firebaseServices = FirebaseServices();

  void getTasks() {
    emit(LoadingTasksState());

    try {
      Stream<List<TaskDataModel>> tasks =
      firebaseServices.getTasks();

      emit(
        SuccessGettingTasksState(
          tasks: tasks,
        ),
      );
    } catch (e) {
      emit(
        FailedGettingTasksState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
  Future<void> deleteTask(String taskId) async {
    try {
      await firebaseServices.deleteTask(taskId);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateTask(TaskDataModel task) async {
    try {
      await firebaseServices.updateTask(task);
    } catch (e) {
      print(e);
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workspace/core/taskModel.dart';
class FirebaseServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  Future<void> createTask(TaskDataModel task) async {
    final user = auth.currentUser;

    if (user == null) return;

    task.userId = user.uid;

    await firestore.collection('tasks').add(
      task.toFireStore(),
    );
  }

  Stream<List<TaskDataModel>> getTasks() {
    final user = auth.currentUser;

    if (user == null) {
      return Stream.value([]);
    }

    return firestore
        .collection('tasks')
        .where('userId', isEqualTo: user.uid)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();

        return TaskDataModel.fromJson({
          ...data,
          'id': doc.id,
        });
      }).toList();
    });
  }

  Future<void> deleteTask(String taskId) async {
    await firestore
        .collection('tasks')
        .doc(taskId)
        .delete();
  }

  // UPDATE
  Future<void> updateTask(TaskDataModel task) async {
    await firestore
        .collection('tasks')
        .doc(task.id)
        .update(task.toFireStore());
  }
}

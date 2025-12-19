import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/models/student_model.dart';
import 'package:riverpod_starter/state/student_state.dart';

//provider //comsuemr = screen
final studentViewmodelProvider =
    NotifierProvider<StudentViewmodel, StudentState>(() {
      return StudentViewmodel();
    });

//reactive programming
class StudentViewmodel extends Notifier<StudentState> {
  @override
  StudentState build() {
    return StudentState();
  }

  Future<void> addStudent(StudentModel student) async {
    state = state.copyWith(isLoading: true);
    final updatedStudents = [...state.lstStudents, student];
    //stop for 2 seconds
    await Future.delayed(Duration(seconds: 2));
    state = state.copyWith(isLoading: false, lstStudents: updatedStudents);
  }

  Future<void> loadStudents() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(Duration(seconds: 2));
    state = state.copyWith(isLoading: false);
  }
}

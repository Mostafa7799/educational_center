import 'package:dio/dio.dart';
import 'package:educational_center/core/api_const.dart';
import 'package:educational_center/data/dio_helper/dio_helper.dart';
import 'package:educational_center/data/models/course_model.dart';
import 'package:educational_center/data/models/courses_time.dart';
import 'package:educational_center/data/models/message_model.dart';
import 'package:educational_center/data/models/questions_model.dart';
import 'package:educational_center/data/models/quiz_model.dart';
import 'package:educational_center/data/models/subject_model.dart';
import 'package:educational_center/data/models/teacher_model.dart';

import '../models/homework_model.dart';
import '../models/levels_model.dart';
import '../models/student_model.dart';
import '../models/top_three_model.dart';
import '../models/user_attendance.dart';

class ApiService {
  Future signup({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: ApiConstant.registerEndPoint,
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        return Map<String, dynamic>.from(response.data);
      } else if (response.data['status'] == 'false') {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  Future login({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: ApiConstant.loginEndPoint,
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        return Map<String, dynamic>.from(response.data);
      } else {
        print((response.data['error']).toString());
        throw (response.data['error']).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  /// Teacher login
  Future loginTeacher({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: ApiConstant.loginTeacherEndPoint,
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return Map<String, dynamic>.from(response.data);
      } else {
        print((response.data['error']).toString());
        throw (response.data['error']).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  /// logout
  Future<String> logout({String? endPoint}) async {
    try {
      final response = await DioHelper.getRequest(
        path: ApiConstant.logoutEndPoint,
      );
      print((response.data).toString());
      if (response.statusCode == 200) {
        return response.data;
      } else if (response.data == 'false') {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
    return '';
  }

  /// Get Student data
  Future<StudentModel> getStudentProfileData() async {
    try {
      final response = await DioHelper.getRequest(
        path: 'user/profile',
      );
      if (response.statusCode == 200) {
        print((response.data).toString());
        return StudentModel.fromJson(response.data);
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
    }
    return StudentModel();
  }

  /// Update student profile
  Future updateStudentProfile({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: ApiConstant.updateEndPoint,
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  /// Update student profile
  Future updateTeacherProfile({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: ApiConstant.updateTeacherProfileEndPoint,
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  /// Teacher Add Quiz
  Future teacherAddQuiz({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: 'teacher/createQuiz',
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  /// Teacher Add Answer to Quiz
  Future teacherAddAnswerToQuiz({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: ApiConstant.addAnswerToQuizEndPoint,
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  /// Teacher Add Material
  Future teacherAddMaterial({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: 'teacher/matterial/store',
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  /// Teacher Add Material
  Future resetPassword({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: 'user/userResetPassword',
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  /// Teacher Add Message
  Future teacherAddMessage({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: 'teacher/sendMessage',
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  /// Teacher Add Homework
  Future teacherAddHomework({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: 'teacher/homework/store',
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  /// Student Answer to quiz
  Future studentAnswerQuiz({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: 'user/userAnswerQuestion',
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  /// Student Answer to homework
  Future studentAnswerHomework({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: 'user/studentAnswerHomework',
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  /// Student send feedback
  Future studentSendFeedback({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: 'user/givefeedback',
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  /// Teacher send attendance
  Future teacherSendAttendance({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await DioHelper.postRequest(
        path: 'teacher/userAttendance',
        data: data,
      );
      print((response).toString());
      if (response.statusCode == 200) {
        print((response).toString());
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
  }

  /// Get Teacher data
  Future<TeacherModel> getTeacherProfileData() async {
    try {
      final response = await DioHelper.getRequest(
        path: ApiConstant.teacherDataEndPoint,
      );
      if (response.statusCode == 200) {
        print((response.data).toString());
        return TeacherModel.fromJson(response.data);
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
    }
    return TeacherModel();
  }

  /// Delete Material Teacher
  Future<String> deleteMaterial({String? id}) async {
    try {
      final response = await DioHelper.getRequest(
        path: "teacher/matterial/delete/$id",
      );
      if (response.statusCode == 200) {
        print((response.data).toString());
        return response.data;
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
    }
    return '';
  }

  /// Get list of subject
  Future<List<SubjectModel>> getSubjectListData({String? endPoint}) async {
    try {
      final response = await DioHelper.getRequest(
        path: endPoint!,
      );
      if (response.statusCode == 200) {
        print((response.data).toString());
        return List<SubjectModel>.from(
          (response.data as List).map(
            (e) => SubjectModel.fromJson(e),
          ),
        );
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
      print(error.toString());
      print(error.toString());
    }
    return [];
  }

  /// Get list of Message
  Future<List<MessagesModel>> getMessageListData() async {
    try {
      final response = await DioHelper.getRequest(
        path: ApiConstant.getMessageEndPoint,
      );
      if (response.statusCode == 200) {
        print((response.data['messages']).toString());
        return List<MessagesModel>.from(
          (response.data['messages'] as List).map(
            (e) => MessagesModel.fromJson(e),
          ),
        );
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
      print(error.toString());
      print(error.toString());
    }
    return [];
  }

  /// Get list of Message
  Future<List<ActiveHomework>> getHomeworkListData({String? id}) async {
    try {
      final response = await DioHelper.getRequest(
        path: 'user/homeworks/$id',
      );
      if (response.statusCode == 200) {
        print((response.data['active_homework']).toString());
        return List<ActiveHomework>.from(
          (response.data['active_homework'] as List).map(
            (e) => ActiveHomework.fromJson(e),
          ),
        );
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
      print(error.toString());
      print(error.toString());
    }
    return [];
  }

  /// Get list of teachers
  Future<List<TeacherModel>> getTeacherListData() async {
    try {
      final response = await DioHelper.getRequest(
        path: ApiConstant.teachersListEndPoint,
      );
      if (response.statusCode == 200) {
        print((response.data).toString());
        return List<TeacherModel>.from(
          (response.data as List).map(
            (e) => TeacherModel.fromJson(e),
          ),
        );
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
    }
    return [];
  }

  /// Get list of Levels
  Future<List<LevelsModel>> getLevelsList() async {
    try {
      final response = await DioHelper.getRequest(
        path: 'user/levels',
      );
      if (response.statusCode == 200) {
        print((response.data).toString());
        return List<LevelsModel>.from(
          (response.data as List).map(
            (e) => LevelsModel.fromJson(e),
          ),
        );
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
    }
    return [];
  }

  /// Get list of Courses
  Future<List<CourseModel>> getCoursesListData(
      {required String endPoint}) async {
    try {
      final response = await DioHelper.getRequest(
        path: endPoint,
      );
      if (response.statusCode == 200) {
        print((response.data).toString());
        return List<CourseModel>.from(
          (response.data as List).map(
            (e) => CourseModel.fromJson(e),
          ),
        );
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
    }
    return [];
  }

  /// Get list of Users
  Future<List<UserAttendance>> getUsersListData({required String id}) async {
    try {
      final response = await DioHelper.getRequest(
        path: "teacher/usersForAttendance/$id",
      );
      if (response.statusCode == 200) {
        print((response.data).toString());
        return List<UserAttendance>.from(
          (response.data['users'] as List).map(
            (e) => UserAttendance.fromJson(e),
          ),
        );
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
    }
    return [];
  }

  /// Get list of Courses
  Future<List<TopThreeModel>> getTopThreeData() async {
    try {
      final response = await DioHelper.getRequest(
        path: 'user/topThree',
      );
      if (response.statusCode == 200) {
        print((response.data).toString());
        return List<TopThreeModel>.from(
          (response.data['top_three_users'] as List).map(
            (e) => TopThreeModel.fromJson(e),
          ),
        );
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
    }
    return [];
  }

  /// Get list of Courses
  Future<List<CourseModel>> getTodayCoursesData({
    required String endPoint,
    required String day,
  }) async {
    try {
      final response = await DioHelper.getRequest(
        path: endPoint,
      );
      if (response.statusCode == 200) {
        print((response.data).toString());
        return List<CourseModel>.from(
          (response.data['courses'] as List).map(
                (e) => CourseModel.fromJson(e),
          ),
        );
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
    }
    return [];
  }

  ///User point
  Future<double> userPoint() async {
    try {
      final response = await DioHelper.getRequest(
        path: 'user/loggedUserPoints',
      );
      if (response.statusCode == 200) {
        print((response.data).toString());
        return response.data['points'];
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
    }
    return 0;
  }

  ///Enroll Course
  Future<Map<String, dynamic>> enrollCourse({required int id}) async {
    try {
      final response = await DioHelper.postRequest(
          path: ApiConstant.enrollToCourseEndPoint,
          data: {
            'course_id': id,
          });
      print((response.data).toString());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
    return {};
  }

  ///Dis Enroll Course
  Future<Map<String, dynamic>> disEnrollCourse({required int id}) async {
    try {
      final response = await DioHelper.postRequest(
          path: ApiConstant.disEnrollToCourseEndPoint,
          data: {
            'course_id': id,
          });
      print((response.data).toString());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print((response.data).toString());
        throw (response.data).toString();
      }
    } on DioError catch (error) {
      print(error.toString());
    }
    return {};
  }

  /// Get list of Quiz
  Future<List<QuizModel>> getQuizListData({String? endPoint}) async {
    try {
      final response = await DioHelper.getRequest(
        path: endPoint!,
      );
      if (response.statusCode == 200) {
        print((response.data).toString());
        return List<QuizModel>.from(
          (response.data as List).map(
            (e) => QuizModel.fromJson(e),
          ),
        );
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
    }
    return [];
  }

  /// Get list of Questions
  Future<List<QuestionsModel>> getQuestionsListData({String? endPoint}) async {
    try {
      final response = await DioHelper.getRequest(
        path: endPoint!,
      );
      if (response.statusCode == 200) {
        print((response.data).toString());
        return List<QuestionsModel>.from(
          (response.data as List).map(
            (e) => QuestionsModel.fromJson(e),
          ),
        );
      } else {
        print((response.data['error']).toString());
        throw response.data;
      }
    } catch (error) {
      print(error.toString());
    }
    return [];
  }
}

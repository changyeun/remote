import 'package:crypto_ui_web/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository{

  Future<List<UserModel>> getUserModel() async{
    try {
      final response = await Supabase.instance.client.from('users').select();
      return UserModel.fromMapList(response);
    } catch (e) {
      print('Error: $e');
    }
    return [];
  }

  // Future<List<Map<String, dynamic>>?> createUser(String userName, String birth, String email ,String phoneNum,String salary,List<String> job, String advice) async {
  //   try {
  //     final data = await Supabase.instance.client.from('users').upsert({
  //       KEY_USER_NAME : userName,KEY_USER_BIRTHDAY : birth, KEY_USER_EMAIL : email, KEY_USER_PHONE_NUMBER : phoneNum,
  //       KEY_USER_SALARY : salary,KEY_USER_JOB : job,KEY_USER_ADVICE : advice, KEY_USER_CREATED_AT: DateTime.now().toIso8601String()
  //     }).select();
  //     print("유저 데이터 확인하기: ${data}");
  //
  //     return data;
  //   } catch (e) {
  //     print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${e}");
  //     print('피드 등록에 실패했습니다. 다시 시도해주세요');
  //     return null;
  //   }
  // }
  //
  // Future<List<Map<String, dynamic>>?> editUser(String userId,String userName, String birth, String email ,String phoneNum,String salary,List<String> job, String advice) async {
  //   try {
  //     final data = await Supabase.instance.client.from(KEY_USER).update({
  //       KEY_USER_NAME : userName,KEY_USER_BIRTHDAY : birth, KEY_USER_EMAIL : email, KEY_USER_PHONE_NUMBER : phoneNum,
  //       KEY_USER_SALARY : salary,KEY_USER_JOB : job,KEY_USER_ADVICE : advice, KEY_USER_CREATED_AT: DateTime.now().toIso8601String()
  //     }).eq(KEY_USER_ID, userId);
  //     print("유저 데이터 확인하기: ${data}");
  //
  //     return data;
  //   } catch (e) {
  //     print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${e}");
  //     print('피드 등록에 실패했습니다. 다시 시도해주세요');
  //     return null;
  //   }
  // }

}

UserRepository userRepository = UserRepository();
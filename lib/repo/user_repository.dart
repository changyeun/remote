import 'package:crypto_ui_web/model/user_model.dart';
import 'package:crypto_ui_web/services/home_service.dart';
import 'package:get/get.dart';
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

  Future<bool> createUser(String email, String userName, String accountType, String profilePhoto,
      String location, String residencyCountry, String nationality, String emailInfo, bool emailNoti, String gender,
      String webSite, String github, String twitter, String linkedIn, String insta, String bio, String skills,
      String languages, String availableWork, String timezones, String annualPay, String hourlyPay,
      String employments, String sideProjects, String educations) async {
    try {
      await Supabase.instance.client.from('users').upsert({
        'email' : email, 'userName' : userName, 'accountType' : accountType, 'profilePhoto' : profilePhoto,
        'location' : location, 'residencyCountry' : residencyCountry, 'nationality' : nationality, 'emailInfo':emailInfo,
        'emailNoti' : emailNoti, 'gender': gender, 'webSite': webSite, 'github': github, 'twitter': twitter,
        'linkedIn': linkedIn, 'insta': insta, 'bio': bio, 'skills': skills, 'languages': languages, 'availableWork': availableWork,
        'timezones': timezones, 'annualPay': annualPay, 'hourlyPay': hourlyPay,
        'employments': employments, 'sideProjects': sideProjects, 'educations': educations
      });
      HomeService.to.type.value = 0;
      HomeService.to.getUserModel();
      return true;
    } catch (e) {
      print(e);
      Get.snackbar('', 'failed $e');
      return false;
    }
  }


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
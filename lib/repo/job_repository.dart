
import 'package:crypto_ui_web/model/job_model.dart';
import 'package:crypto_ui_web/services/home_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class JobsRepository{

  Future<List<JobModel>> getJobsModel() async{
    try {
      final response = await Supabase.instance.client.from('jobs').select();
      return JobModel.fromMapList(response);
    } catch (e) {
      print('Error: $e');
    }
    return [];
  }


  Future<bool> createJob(String title, String category, String skill, String worldWide, String salaryRange, String jobType,
      String linkOrEmail, String location, String aboutRole, String responsibility, String qualifications, String benefits,
      String companyName, String companyHQ, String photo, String website, String email, String des) async {
    try {
      await Supabase.instance.client.from('users').upsert({
        'title' : title, 'category' : category, 'skill' : skill, 'worldWide' : worldWide,
        'salaryRange' : salaryRange, 'jobType' : jobType, 'linkOrEmail' : linkOrEmail, 'location':location,
        'aboutRole' : aboutRole, 'responsibility': responsibility, 'qualifications': qualifications,
        'benefits': benefits, 'companyName': companyName, 'companyHQ': companyHQ, 'photo': photo,
        'website': website, 'email': email, 'des': des
      });
      HomeService.to.type.value = 0;
      return true;
    } catch (e) {
      print(e);
      Get.snackbar('', 'failed $e');
      return false;
    }


  }

}

JobsRepository jobsRepository = JobsRepository();
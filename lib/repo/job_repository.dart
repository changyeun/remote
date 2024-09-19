
import 'package:crypto_ui_web/model/job_model.dart';
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

}

JobsRepository jobsRepository = JobsRepository();
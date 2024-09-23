import 'dart:io';
import 'package:crypto_ui_web/model/job_model.dart';
import 'package:crypto_ui_web/model/user_model.dart';
import 'package:crypto_ui_web/repo/job_repository.dart';
import 'package:crypto_ui_web/repo/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeService extends GetxService {
  static HomeService get to => Get.find();

  RxInt type = 0.obs;
  RxInt profileType = 0.obs;
  RxInt selectJobIndex = 0.obs;

  RxList<UserModel> userModelList =  RxList([]);
  RxList<UserModel> selectUserModelList =  RxList([]);
  RxList<JobModel> jobModelList = RxList([]);
  TextEditingController textEditingEmailController = TextEditingController();

  List<String> skillList = ['All', 'Engineer', 'Executive', 'Senior', 'Developer', 'Finance', 'SysAdmin', 'JavaScript', 'Backend', 'Golang',
    'Cloud', 'Medical', 'FrontEnd', 'FullStack', 'Ops', 'Design', 'React', 'InfoSec', 'Marketing', 'Mobile', 'ContentWriting',
    'Saas', 'Recruiter', 'API', 'Sales', 'Ruby', 'Education', 'DevOps', 'Stats', 'Python', 'Node', 'English', 'NonTech', 'Video',
    'Travel', 'QualityAssurance', 'Ecommerce', 'Teaching', 'Linux', 'Java', 'Crypto', 'Junior', 'Git', 'Legal', 'Android', 'Accounting',
    'Admin', 'Microsoft', 'Excel', 'PHP'];

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    await Future.wait([
      getUserModel(),
      getJobModel()
    ]);

  }

  Future<void> getUserModel() async{
    userModelList.value = await userRepository.getUserModel();
    for(int i=0;i<userModelList.length;i++){
      selectUserModelList.add(userModelList[i]);
    }
  }

  Future<void> getJobModel() async{
    jobModelList.value = await jobsRepository.getJobsModel();
  }
}

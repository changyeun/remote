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
  RxList<JobModel> jobModelList = RxList([]);

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
  }

  Future<void> getJobModel() async{
    jobModelList.value = await jobsRepository.getJobsModel();
  }
}

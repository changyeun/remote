import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/views/home_view.dart';
import 'package:crypto_ui_web/screen/views/job_detail_view.dart';
import 'package:crypto_ui_web/screen/views/job_post_view.dart';
import 'package:crypto_ui_web/screen/views/profile_edit_view.dart';
import 'package:crypto_ui_web/screen/views/profile_email_view.dart';
import 'package:crypto_ui_web/screen/views/profile_list_view.dart';
import 'package:crypto_ui_web/services/home_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 250,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            HomeService.to.type.value = 0;
          },
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.only(left: 120, top: 21, bottom: 21),
            child: SizedBox(
              child: Image.asset(
                'assets/images/Frame 19.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 27),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    HomeService.to.type.value = 1;
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11.5),
                    decoration: BoxDecoration(
                      color: AppColors.mint,
                      borderRadius: BorderRadius.circular(500),
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 14, color: Colors.white, height: 1, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                GestureDetector(
                  onTap: (){
                    HomeService.to.type.value = 2;
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11.5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(color: AppColors.mint, width: 1),
                    ),
                    child: const Text(
                      'Profile',
                      style: TextStyle(fontSize: 14, color: AppColors.mint, height: 1, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                GestureDetector(
                  onTap: (){
                    HomeService.to.type.value = 3;
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11.5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(color: AppColors.mint, width: 1),
                    ),
                    child: const Text(
                      '+ Post a job',
                      style: TextStyle(fontSize: 14, color: AppColors.mint, height: 1, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                GestureDetector(
                  onTap: (){
                    HomeService.to.type.value = 1;
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(
                      'assets/images/image_empty_profile.png',
                      fit: BoxFit.contain,
                      width: 56,
                      height: 56,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              HomeService.to.type.value == 1? const ProfileEmailView():
              HomeService.to.type.value == 2? const ProfileListView():
              HomeService.to.type.value == 3? JobPostView():
              HomeService.to.type.value == 4? const JobDetailView():
              const HomeView(),

              //footer
              Container(
                height: 426,
                width: Get.width,
                color: AppColors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/remote.island.png', fit: BoxFit.contain, height: 24),
                            const SizedBox(height: 40),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Company', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.white)),
                                    SizedBox(height: 24),
                                    Text('Why remoteisland', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.white)),
                                    SizedBox(height: 12),
                                    Text('Terms of Use & Privacy Policy', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.white)),
                                    SizedBox(height: 12),
                                    Text('RSS', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.white)),
                                  ],
                                ),
                                SizedBox(width: 100),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('For job seekers', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.white)),
                                    SizedBox(height: 24),
                                    Text('Sign up with Remote Jobs', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.white)),
                                    SizedBox(height: 12),
                                    Text('Browse remote jobs', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.white)),
                                  ],
                                ),
                                SizedBox(width: 100),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('For companies', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.white)),
                                    SizedBox(height: 24),
                                    Text('post a remote job', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.white)),
                                    SizedBox(height: 12),
                                    Text('Create a company profile', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/insta_img.png',
                              width: 32,
                              height: 32,
                            ),
                            const SizedBox(width: 16),
                            Image.asset(
                              'assets/images/web_img.png',
                              width: 32,
                              height: 32,
                            ),
                            const SizedBox(width: 16),
                            Image.asset(
                              'assets/images/linkedin_img.png',
                              width: 32,
                              height: 32,
                            ),
                            const SizedBox(width: 16),
                            Image.asset(
                              'assets/images/youtube_img.png',
                              width: 32,
                              height: 32,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Center(child: Text('Copyright © 2024. Remote island🏝️ All rights reserved.', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.white))),
                  ],
                ),
              ),
            ],
          )),
    ));
  }
}

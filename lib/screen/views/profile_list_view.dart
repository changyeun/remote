import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/services/home_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileListView extends StatefulWidget {
  ProfileListView({super.key});

  RxString selectTag = ''.obs;


  @override
  State<ProfileListView> createState() => _ProfileListViewState();
}

class _ProfileListViewState extends State<ProfileListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/profile_list_section_1.png',
          fit: BoxFit.contain,
        ),

        const SizedBox(height: 52),
        const Text('Select Tag', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: AppColors.black)),
        const SizedBox(height: 40),
        //tag
        Center(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 100),
            width: Get.width,
            child: Wrap(
              children: List.generate(HomeService.to.skillList.length,
                      (index) => GestureDetector(
                        onTap: (){
                          widget.selectTag.value = HomeService.to.skillList[index];
                          HomeService.to.selectUserModelList.value = [];
                          if(widget.selectTag.value == 'All' || widget.selectTag.value == ''){
                            for(int i=0;i<HomeService.to.userModelList.length;i++){
                              HomeService.to.selectUserModelList.add(HomeService.to.userModelList[i]);
                            }
                          } else{
                            for(int i=0; i<HomeService.to.userModelList.length; i++){
                              List<String> skillList = (HomeService.to.userModelList[i].skills ?? '').split(',');
                              for(int i=0;i<skillList.length;i++){
                                skillList[i] = skillList[i].replaceAll(' ', '');
                              }
                              if(skillList.contains(widget.selectTag.value)){
                                HomeService.to.selectUserModelList.add(HomeService.to.userModelList[i]);
                              }
                            }
                          }
                        },
                        child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                                            margin: const EdgeInsets.only(right: 20, bottom: 20),
                                            decoration: BoxDecoration(
                        color: AppColors.mint_light,
                        borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: Text(HomeService.to.skillList[index], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1, color: AppColors.mint)),
                                          ),
                      )),
            ),
          ),
        ),
        const SizedBox(height: 52),

        const SizedBox(height: 120),

        //list
        Obx(() => Container(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Wrap(
            children: List.generate(HomeService.to.selectUserModelList.length,
                    (index) =>  Builder(
                      builder: (context) {
                        List<String> skillList = (HomeService.to.selectUserModelList[index].skills ?? '').split(',');
                        for(int i=0;i<skillList.length;i++){
                          skillList[i] = skillList[i].replaceAll(' ', '');
                        }
                        return Container(
                          width: 284,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.grey2, width: 1),
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 22, bottom: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                width: 256,
                                height: 256,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: HomeService.to.selectUserModelList[index].profilePhoto == ''?
                                    const DecorationImage(
                                        image: AssetImage('assets/images/image_empty_profile.png'),
                                        fit: BoxFit.fill):
                                    DecorationImage(
                                        image: NetworkImage(HomeService.to.selectUserModelList[index].profilePhoto ?? ''),
                                        fit: BoxFit.fill)
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${HomeService.to.selectUserModelList[index].userName}\n${HomeService.to.selectUserModelList[index].bio}',
                                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.4, color: AppColors.grey1)),
                                  const SizedBox(height: 20),
                                  Wrap(
                                    children: List.generate(skillList.length ?? 0,
                                            (index) => Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                                          margin: const EdgeInsets.only(right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                            color: AppColors.mint_light,
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: Text(skillList[index], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1, color: AppColors.mint)),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ));
                      }
                    )),
          ),
        )),
        const SizedBox(height: 152),

        Container(
          height: 400,
          width: Get.width,
          color: AppColors.mint,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Live Remote island, work from anywhere.', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, height: 1.5, color: Colors.white)),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  HomeService.to.type.value = 1;
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11.5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(500),
                  ),
                  child: const Text(
                    'Sign up for free',
                    style: TextStyle(fontSize: 14, color: AppColors.mint, height: 1, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

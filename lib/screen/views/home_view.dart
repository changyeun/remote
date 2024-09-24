import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/views/profile_list_view.dart';
import 'package:crypto_ui_web/screen/widget/remote_style.dart';
import 'package:crypto_ui_web/services/home_service.dart';
import 'package:crypto_ui_web/share/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  RxString selectedCategoryItem = 'Please Select'.obs;
  RxString selectedLocationItem = 'Please Select'.obs;
  RxString selectedSalaryItem = 'Please Select'.obs;
  RxString selectedSkillItem = 'Please Select'.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/home_section_1.png',
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/images/home_section_2.png',
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 70),

        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
          child: Wrap(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){
                    selectedCategoryItem.value = 'Please Select';
                    selectedLocationItem.value = 'Please Select';
                    selectedSalaryItem.value = 'Please Select';
                    selectedSkillItem.value = 'Please Select';
                    HomeService.to.selectJobModelList.value = [];
                    for(int i=0;i<HomeService.to.jobModelList.length;i++){
                      HomeService.to.selectJobModelList.add(HomeService.to.jobModelList[i]);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      color: Colors.white,
                      border: Border.all(color: AppColors.grey2, width: 1),
                    ),
                    child: const Text(
                      'ALL',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black, height: 1.1),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              SizedBox(
                width: 235,
                  child: RemoteStyle.remoteMainDropdown(HomeService.to.categoryList, selectedCategoryItem, (value) async {
                    selectedDropDownChanged(value as String, selectedCategoryItem);
                  })),
              const SizedBox(width: 14),
              SizedBox(
                  width: 300,
                  child: RemoteStyle.remoteMainDropdown(HomeService.to.locationList, selectedLocationItem, (value) async {
                    selectedDropDownChanged(value as String, selectedLocationItem);
                  })),
              const SizedBox(width: 14),
              SizedBox(
                  width: 220,
                  child: RemoteStyle.remoteMainDropdown(HomeService.to.salaryList, selectedSalaryItem, (value) async {
                    selectedDropDownChanged(value as String, selectedSalaryItem);
                  })),
              const SizedBox(width: 14),
              SizedBox(
                  width: 170,
                  child: RemoteStyle.remoteMainDropdown(HomeService.to.homeSkillList, selectedSkillItem, (value) async {
                    selectedDropDownChanged(value as String, selectedSkillItem);
                  })),

            ],
          ),
        ),
        const SizedBox(height: 38),


        //home list
        Obx(() => ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 1532,
          ),
          child: Column(
              children: List.generate(
                HomeService.to.selectJobModelList.length,
                    (index) => Column(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          HomeService.to.type.value = 4;
                          HomeService.to.selectJobIndex.value = index;
                        },
                        child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: AppColors.grey2, width: 1),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
                            child: Row(
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(500),
                                      image: HomeService.to.selectJobModelList[index].photo == ''?
                                      const DecorationImage(
                                          image: AssetImage('assets/images/img_empty_job.png'),
                                          fit: BoxFit.fill):
                                      DecorationImage(
                                          image: NetworkImage(HomeService.to.selectJobModelList[index].photo ?? ''),
                                          fit: BoxFit.fill)
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(child: Text(HomeService.to.selectJobModelList[index].title ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 1, color: AppColors.black))),
                                          Builder(
                                            builder: (context) {
                                              List<String> skillList = (HomeService.to.selectJobModelList[index].skill ?? '').split(',');
                                              for(int i=0;i<skillList.length;i++){
                                                skillList[i] = skillList[i].replaceAll(' ', '');
                                              }
                                              return Wrap(
                                                children: List.generate(skillList.length ?? 0,
                                                        (index) => Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                                                      margin: const EdgeInsets.only(left: 10),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.mint_light,
                                                        borderRadius: BorderRadius.circular(4),
                                                      ),
                                                      child: Text(skillList[index], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1, color: AppColors.mint)),
                                                    )),
                                              );
                                            }
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 14),
                                      Row(
                                        children: [
                                          Expanded(child: Text(HomeService.to.selectJobModelList[index].companyName ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                                          Text('${RemoteUtils.dateDifference(HomeService.to.selectJobModelList[index].createdAt)} days ago', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1, color: AppColors.grey1))
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    const SizedBox(height: 16)
                  ],
                ),
              )),
        )),

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
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
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
              ),
            ],
          ),
        ),
      ],
    );
  }

  void selectedDropDownChanged(String value, RxString selectedItem){
    selectedItem.value = value;

    HomeService.to.selectJobModelList.value = [];
    if(selectedCategoryItem.value == 'Please Select' && selectedLocationItem.value == 'Please Select' &&
        selectedSalaryItem.value == 'Please Select' && selectedSkillItem.value == 'Please Select'){
      for(int i=0;i<HomeService.to.jobModelList.length;i++){
        HomeService.to.selectJobModelList.add(HomeService.to.jobModelList[i]);
      }
    } else{
      for(int i=0; i<HomeService.to.jobModelList.length; i++){
        if((selectedCategoryItem.value == 'Please Select' || selectedCategoryItem.value == HomeService.to.jobModelList[i].category)
          && (selectedLocationItem.value == 'Please Select' || selectedLocationItem.value == HomeService.to.jobModelList[i].location)
          && (selectedSalaryItem.value == 'Please Select' || selectedSalaryItem.value == HomeService.to.jobModelList[i].salaryRange)
          && (selectedSkillItem.value == 'Please Select' || selectedSkillItem.value == HomeService.to.jobModelList[i].skill)){
          HomeService.to.selectJobModelList.add(HomeService.to.jobModelList[i]);
        }
      }
    }

  }
}
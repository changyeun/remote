import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/services/home_service.dart';
import 'package:crypto_ui_web/share/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html' as html;

class JobDetailView extends StatefulWidget {
  const JobDetailView({super.key});

  @override
  State<JobDetailView> createState() => _JobDetailViewState();
}

class _JobDetailViewState extends State<JobDetailView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 120),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: (){
                HomeService.to.type.value = 0;
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/arrow-right.png',
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(width: 4),
                    const Text('Back to all jobs', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.mint),),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),

          Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].title ?? '',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: AppColors.black),),
          const SizedBox(height: 4),
          Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].companyName ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.black),),
          const SizedBox(height: 24),
          Text('${HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].location ?? ''} ·  ${RemoteUtils.dateDifference(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].createdAt)} days ago', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.grey1),),
          const SizedBox(height: 100),


          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.grey2, width: 1),
                        ),
                        padding: const EdgeInsets.all(40),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('About ${HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].companyName ?? ''}', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.black),),
                            const SizedBox(height: 14),
                            Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].des ?? '',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.black),),
                            const SizedBox(height: 40),

                            const Text('About the Role', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.black),),
                            const SizedBox(height: 14),
                            Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].aboutRole ?? '',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.black),),
                            const SizedBox(height: 40),

                            const Text('Skills', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.black),),
                            const SizedBox(height: 14),
                            Builder(
                                builder: (context) {
                                  List<String> skillList = (HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].skill ?? '').split(',');
                                  for(int i=0;i<skillList.length;i++){
                                    skillList[i] = skillList[i].replaceAll(' ', '');
                                  }
                                  return Wrap(
                                    children: List.generate(skillList.length ?? 0,
                                            (index) => Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                                          margin: const EdgeInsets.only(right: 10),
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
                        )),
                    const SizedBox(height: 16),
                
                    Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.grey2, width: 1),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Responsibilities', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.black),),
                            const SizedBox(height: 14),
                            Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].responsibility ?? '',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.black),),
                            const SizedBox(height: 40),

                            const Text('Qualifications', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.black),),
                            const SizedBox(height: 14),
                            Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].qualifications ?? '',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.black),),
                            const SizedBox(height: 40),

                            const Text('Benefits', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.black),),
                            const SizedBox(height: 14),
                            Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].benefits ?? '',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.black),),
                          ],
                        )),
                    const SizedBox(height: 16),
                
                    Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.grey2, width: 1),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Salary and Compensation', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.black),),
                            const SizedBox(height: 14),
                            Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].salaryRange ?? '',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.black),),
                          ],
                        )),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
              const SizedBox(width: 19),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.mint_light,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                width: 388,
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          image: HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].photo == ''?
                          const DecorationImage(
                              image: AssetImage('assets/images/img_empty_job.png'),
                              fit: BoxFit.fill):
                          DecorationImage(
                              image: NetworkImage(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].photo ?? ''),
                              fit: BoxFit.fill)
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].companyName ?? '', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.black),),
                    const SizedBox(height: 40),

                    Row(
                      children: [
                        Image.asset(
                          'assets/images/earth.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].website ?? '',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.grey1),),
                      ],
                    ),
                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Image.asset(
                          'assets/images/home.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].worldWide == "Yes"? 'Remote':'not Remote',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.grey1),),
                      ],
                    ),
                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Image.asset(
                          'assets/images/target.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].location ?? '',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.grey1),),
                      ],
                    ),
                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Image.asset(
                          'assets/images/time.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].jobType ?? '',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.grey1),),
                      ],
                    ),
                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Image.asset(
                          'assets/images/wallet.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].salaryRange ?? '',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.grey1),),
                      ],
                    ),
                    // const SizedBox(height: 14),
                    //
                    // Row(
                    //   children: [
                    //     Image.asset(
                    //       'assets/images/calendar.png',
                    //       width: 20,
                    //       height: 20,
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].salaryRange ?? '',
                    //       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.grey1),),
                    //   ],
                    // ),
                    // const SizedBox(height: 14),
                  ],
                ),
              )
            ],
          ),





          Container(
            padding: const EdgeInsets.only(right: 388+ 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async{
                      html.window.location.href = HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].website ?? '';
                    },
                    child: Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            // margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 15),
                            decoration: BoxDecoration(
                              color: AppColors.mint,
                              borderRadius: BorderRadius.circular(500),
                            ),
                            child: const Text(
                              'Apply',
                              style: TextStyle(fontSize: 14, color: Colors.white, height: 1, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Share this job!',
                      style: TextStyle(fontSize: 14, color: AppColors.grey1, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/share_telegram.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 14),
                        Image.asset(
                          'assets/images/share_linkedin.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 14),
                        Image.asset(
                          'assets/images/share_twitter.png',
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 93),
          const SizedBox(height: 120),


          if(HomeService.to.selectRecommendJobModelList.isNotEmpty)...[
            const Text('Related jobs', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.black),),
            const SizedBox(height: 40),
            Column(
                children: List.generate(
                  HomeService.to.selectRecommendJobModelList.length > 3 ? 3:HomeService.to.selectRecommendJobModelList.length,
                      (index) => Column(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () async{
                            HomeService.to.type.value = 0;
                            await 0.1.delay();
                            HomeService.to.type.value = 4;
                            // HomeService.to.selectJobIndex.value = index;
                            HomeService.to.recommendJobList(HomeService.to.selectRecommendJobModelList[index].id ?? '', HomeService.to.selectRecommendJobModelList[index].skill ?? '');
                          },
                          child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: AppColors.grey2, width: 1),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                              // margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
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
            const SizedBox(height: 120),
          ],


        ],
      ),
    );
  }
}

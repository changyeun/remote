import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/services/home_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          GestureDetector(
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
          const SizedBox(height: 50),

          Text(HomeService.to.jobModelList[HomeService.to.selectJobIndex.value].name ?? '',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: AppColors.black),),
          const SizedBox(height: 4),
          const Text('OneCompany', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.black),),
          const SizedBox(height: 24),
          const Text('Los Angeles, United States ·  4 days ago', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.grey1),),
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
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('About OneCompany', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.black),),
                            SizedBox(height: 14),
                            Text('Hipster ipsum tattooed brunch Im baby. Goth pok 90s raclette man level cred fixie shoreditch four. Wolf typewriter wolf taxidermy before lomo live-edge bruh pinterest tilde. Goth quinoa party a kogi gochujang. Plaid shoreditch +1 craft belly poke. Cold-pressed poutine narwhal tofu pack pork master truffaut +1. Craft batch hashtag meggings direct green tousled on. Hashtag truck slow-carb art blog blue. Pop-up adaptogen plant snackwave small portland jean fund gentrify banh. Roof copper santo hot wolf.',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.black),),
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
                        child: Row(
                          children: [
                            Container(width: 54, height: 54, color: Colors.red),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(child: Text('Director, Product Management', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 1, color: AppColors.black))),
                                      Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                                            decoration: BoxDecoration(
                                              color: AppColors.mint_light,
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: const Text('abed', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1, color: AppColors.mint)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  const Row(
                                    children: [
                                      Expanded(child: Text('Director, Product Management', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                                      Text('1 days ago', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1, color: AppColors.grey1))
                                    ],
                                  )
                                ],
                              ),
                            )
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
                        child: Row(
                          children: [
                            Container(width: 54, height: 54, color: Colors.red),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(child: Text('Director, Product Management', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 1, color: AppColors.black))),
                                      Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                                            decoration: BoxDecoration(
                                              color: AppColors.mint_light,
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: const Text('abed', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1, color: AppColors.mint)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  const Row(
                                    children: [
                                      Expanded(child: Text('Director, Product Management', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                                      Text('1 days ago', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1, color: AppColors.grey1))
                                    ],
                                  )
                                ],
                              ),
                            )
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
                child: const Column(
                  children: [
                    Text('OneCompany', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.black),),
                  ],
                ),
              )
            ],
          ),



          Row(
            children: [
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
          const SizedBox(height: 93),
          const SizedBox(height: 120),

        ],
      ),
    );
  }
}

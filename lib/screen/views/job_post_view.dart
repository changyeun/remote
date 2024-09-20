import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/remote_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobPostView extends StatefulWidget {
  JobPostView({super.key});

  //text
  TextEditingController textEditingTitleController = TextEditingController();
  TextEditingController textEditingLinkOrEmailController = TextEditingController();
  TextEditingController textEditingLocationController = TextEditingController();
  TextEditingController textEditingAboutRoleController = TextEditingController();
  TextEditingController textEditingResponseController = TextEditingController();
  TextEditingController textEditingQualityController = TextEditingController();
  TextEditingController textEditingBenefitController = TextEditingController();
  TextEditingController textEditingCompanyNameController = TextEditingController();
  TextEditingController textEditingCompanyHQController = TextEditingController();
  TextEditingController textEditingWebsiteController = TextEditingController();
  TextEditingController textEditingEmailController = TextEditingController();
  TextEditingController textEditingDesController = TextEditingController();

  //dropdown
  RxString selectedCategoryItem = 'Please Select'.obs;
  RxString selectedSkillItem = 'Select all skills that apply'.obs;
  RxString selectedSalaryRangeItem = 'Please Select'.obs;
  //radio
  RxString radioWorldwide = 'Yes'.obs;
  RxString radioJobType = 'Full-Time'.obs;

  @override
  State<JobPostView> createState() => _JobPostViewState();
}

class _JobPostViewState extends State<JobPostView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/job_post_section_1.png',
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 80),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 100),
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
                  'Save and Post',
                  style: TextStyle(fontSize: 14, color: Colors.white, height: 1, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 80),
        Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.grey2, width: 1),
            ),
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("First, tell us about the position", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.8, color: AppColors.mint)),
                const SizedBox(height: 40),

                //job title
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Job Title', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                    SizedBox(width: 2),
                    Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/info_circle.png',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 4),
                    const Text('Ecample: “Senior Designer.” Titles must describe one posiition.',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.2, color: AppColors.grey1)),
                  ],
                ),
                const SizedBox(height: 10),
                RemoteStyle.remoteText('Position', widget.textEditingTitleController),

                //category
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Category', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                              SizedBox(width: 2),
                              Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                            ],
                          ),
                          const SizedBox(height: 10),
                          RemoteStyle.remoteDropdown(['g', 'ml'], widget.selectedCategoryItem),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: Column(
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Skill (If Applicable)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                              // SizedBox(width: 2),
                              // Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                            ],
                          ),
                          const SizedBox(height: 10),
                          RemoteStyle.remoteDropdown(['g', 'ml'], widget.selectedSkillItem),
                        ],
                      ),
                    ),
                  ],
                ),

                //worldwide
                const SizedBox(height: 40),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Is This Role Open Worldwide?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                    SizedBox(width: 2),
                    Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/info_circle.png',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 4),
                    const Text('Selectiong ‘Yes’ means your future hire can work anywhere in the world without any location or time zone restrictions!',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.2, color: AppColors.grey1)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => SizedBox(width: 150, child: RadioListTile(title: const Text('Yes'), value: 'Yes', groupValue: widget.radioWorldwide.value, onChanged: (value){widget.radioWorldwide.value = value!;}))),
                    Obx(() => SizedBox(width: 150, child: RadioListTile(title: const Text('No'), value: 'No', groupValue: widget.radioWorldwide.value, onChanged: (value){widget.radioWorldwide.value = value!;})))
                  ],
                ),

                //salary range
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Salary Range', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                              // SizedBox(width: 2),
                              // Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                            ],
                          ),
                          const SizedBox(height: 10),
                          RemoteStyle.remoteDropdown(['g', 'ml'], widget.selectedSalaryRangeItem),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: Column(
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Job Type', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                              SizedBox(width: 2),
                              Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() => SizedBox(width: 200, child: RadioListTile(title: const Text('Full-Time'), value: 'Full-Time', groupValue: widget.radioJobType.value, onChanged: (value){widget.radioJobType.value = value!;}))),
                              Obx(() => SizedBox(width: 200, child: RadioListTile(title: const Text('Contract'), value: 'Contract', groupValue: widget.radioJobType.value, onChanged: (value){widget.radioJobType.value = value!;})))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //link email
                const SizedBox(height: 40),
                Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Application Link or Email', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                        SizedBox(width: 2),
                        Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/info_circle.png',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 4),
                        const Text('Link to Application page or Email address.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.2, color: AppColors.grey1)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    RemoteStyle.remoteText('Position', widget.textEditingLinkOrEmailController),
                  ],
                ),

                //location
                const SizedBox(height: 40),
                Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                        SizedBox(width: 2),
                        Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/info_circle.png',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 4),
                        const Text('Link to Application page or Email address.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.2, color: AppColors.grey1)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    RemoteStyle.remoteText('Position', widget.textEditingLocationController),
                  ],
                ),

                //About the Role
                const SizedBox(height: 40),
                Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('About the Role', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                        SizedBox(width: 2),
                        Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/info_circle.png',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 4),
                        const Text('Link to Application page or Email address.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.2, color: AppColors.grey1)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    RemoteStyle.remoteMultiText('Placeholder', widget.textEditingLocationController, maxLines: 3),
                  ],
                ),


                const SizedBox(height: 40),
                const Text("More details about the Position", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.8, color: AppColors.mint)),

                const SizedBox(height: 40),
                Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Responsibilities', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                        SizedBox(width: 2),
                        Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                      ],
                    ),
                    const SizedBox(height: 10),
                    RemoteStyle.remoteMultiText('Placeholder', widget.textEditingResponseController, maxLines: 5),
                  ],
                ),

                const SizedBox(height: 12),
                Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Qualifications', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                        SizedBox(width: 2),
                        Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                      ],
                    ),
                    const SizedBox(height: 10),
                    RemoteStyle.remoteMultiText('Placeholder', widget.textEditingQualityController, maxLines: 5),
                  ],
                ),

                const SizedBox(height: 12),
                Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Benefits', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                        SizedBox(width: 2),
                        Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                      ],
                    ),
                    const SizedBox(height: 10),
                    RemoteStyle.remoteMultiText('Placeholder', widget.textEditingBenefitController, maxLines: 5),
                  ],
                ),




              ],
            )),

        const SizedBox(height: 30),

        Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.grey2, width: 1),
            ),
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Tell Us More About Your Company", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.8, color: AppColors.mint)),

                //company
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Company Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                              SizedBox(width: 2),
                              Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/info_circle.png',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 4),
                              const Text('Enter your company or organization’s name.',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.2, color: AppColors.grey1)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          RemoteStyle.remoteText('Placeholder', widget.textEditingCompanyNameController),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: Column(
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Company HQ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                              SizedBox(width: 2),
                              Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/info_circle.png',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 4),
                              const Text('Where your company is officially headquartered.',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.2, color: AppColors.grey1)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          RemoteStyle.remoteText('Placeholder', widget.textEditingCompanyHQController),
                        ],
                      ),
                    ),
                  ],
                ),


                //photo
                const SizedBox(height: 40),
                Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Photo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                        SizedBox(width: 2),
                        Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //rust edit
                    RemoteStyle.remoteText('Placeholder', widget.textEditingCompanyNameController),
                  ],
                ),

                //url, email
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Company’s Website URL', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                              SizedBox(width: 2),
                              Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/info_circle.png',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 4),
                              const Text('Example: https://remoteisland.com',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.2, color: AppColors.grey1)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          RemoteStyle.remoteText('Placeholder', widget.textEditingWebsiteController),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: Column(
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                              SizedBox(width: 2),
                              Text('*', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: Color.fromRGBO(246, 84, 40, 1))),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/info_circle.png',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 4),
                              const Text('We’ll send your receipt and confirmation email here.',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.2, color: AppColors.grey1)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          RemoteStyle.remoteText('Placeholder', widget.textEditingEmailController),
                        ],
                      ),
                    ),
                  ],
                ),

                //des
                const SizedBox(height: 40),
                RemoteStyle.remoteMultiText('Placeholder', widget.textEditingDesController, maxLines: 10),

              ],
            )),

        const SizedBox(height: 80),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                },
                child: Container(
                  // margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 15),
                  decoration: BoxDecoration(
                    color: AppColors.mint,
                    borderRadius: BorderRadius.circular(500),
                  ),
                  child: const Text(
                    'Save and Post',
                    style: TextStyle(fontSize: 14, color: Colors.white, height: 1, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 80),



        Container(
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // border: Border.all(color: AppColors.grey2, width: 1),
                color: AppColors.mint_light
            ),
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/job_post_profile-image.png'),
                          fit: BoxFit.fill)
                  ),
                ),
                const SizedBox(height: 40),
                const Text('Hi! I’m the maker of Remote island. Remote island isn’t a big team, some nerds operates on a laptop somewhere in the world.\n'
                    'I built Remote island to help people and companies grow as fast as they can with no boundaries.\n\n'
                    'Remote work gives people more flexibility in their daily lives. Businesses also benefit from a remote workforce, which reduces costs for real estate and utilities and allows them to hire top talent workers from around the globe. The world of work is shifting toward flexibility, and that’s the most significant change to work since the industrial revolution. This is why I make this platform.\n'
                    'Need help? Here’s my LinkedIn. DM me and I’ll help you personally and also can offer you some discount.\n'
                    'Go Remote, Live in Remote Island!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.2, color: AppColors.black)),
                const SizedBox(height: 40),
                const Text('- Baekla Jeong, Founder of Remote island', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.2, color: AppColors.black)),
              ],
            )),
        const SizedBox(height: 73),
      ],
    );
  }
}

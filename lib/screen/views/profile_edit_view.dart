import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/remote_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ProfileEditView extends StatefulWidget {
  ProfileEditView({super.key});

  //text
  TextEditingController textEditingUserNameController = TextEditingController();
  TextEditingController textEditingLinkOrEmailController = TextEditingController();
  TextEditingController textEditingEmailController = TextEditingController();
  TextEditingController textEditingWebsiteController = TextEditingController();
  TextEditingController textEditingGithubController = TextEditingController();
  TextEditingController textEditingTwitterController = TextEditingController();
  TextEditingController textEditingLinkedInController = TextEditingController();
  TextEditingController textEditingInstagramController = TextEditingController();

  //dropdown
  RxString selectedAccountTypeItem = 'Please Select'.obs;
  RxString selectedLocationItem = 'Please Select'.obs;
  RxString selectedResidencyCountryItem = 'Please Select'.obs;
  RxString selectedNationalityItem = 'Please Select'.obs;

  //radio
  RxString radioGender = 'Man'.obs;
  RxBool checkboxEmailNoti = true.obs;

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/profile_section_1.png',
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
                  'Save changes',
                  style: TextStyle(fontSize: 14, color: Colors.white, height: 1, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 80),
        //profile
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
                const Text('Profile', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.8, color: AppColors.black)),

                //username
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(child: Text('Username', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                    Expanded(child: RemoteStyle.remoteText('Username', widget.textEditingUserNameController)),
                  ],
                ),

                //Account type
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(child: Text('Account type', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                    Expanded(child: RemoteStyle.remoteDropdown(['g', 'ml'], widget.selectedAccountTypeItem)),
                  ],
                ),

                //profile photo
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Profile photo', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black)),
                        SizedBox(height: 10),
                        Text('Please set a real full-color profile photo . (not black and white)\nof just your face. Please smile :)\n\n'
                          'If the robot can’t detect a face, please try a different photo.\n\n'
                          'Make sure the photo is square, color, high res, at least 500x500 px,\nand you look into the camera.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                      ],
                    )),
                    Expanded(child:
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/images/image_profile_empty_profile.png',
                        width: 168,
                        height: 168,
                      ),
                    ),),
                  ],
                ),

                //location
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Account type', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black)),
                        SizedBox(height: 10),
                        Text('In which country are you staying now?\nThis helps us connect you to other remote workers there.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                      ],
                    )),
                    Expanded(child: RemoteStyle.remoteDropdown(['g', 'ml'], widget.selectedLocationItem)),
                  ],
                ),

                //Residency country
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Residency country', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black)),
                        SizedBox(height: 10),
                        Text('What’s your current legal country of residence?\n'
                            'This is the country you’re legally registered as a resident at the city or country\n'
                            'government. If you don’t have one now, use your last known. This is important\n'
                            'for employers.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                      ],
                    )),
                    Expanded(child: RemoteStyle.remoteDropdown(['g', 'ml'], widget.selectedResidencyCountryItem)),
                  ],
                ),

                //Nationality
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nationality', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black)),
                        SizedBox(height: 10),
                        Text('What’s the country in your passport?\nIf you have multiple, use the primary. This is important for employers.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                      ],
                    )),
                    Expanded(child: RemoteStyle.remoteDropdown(['g', 'ml'], widget.selectedNationalityItem)),
                  ],
                ),

                //Email
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Eamil', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black)),
                        SizedBox(height: 10),
                        Text('We never dispaly this on the site, but you use this for logging in. And we forward you messages from employers, as well as you notifications.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                      ],
                    )),
                    Expanded(child: RemoteStyle.remoteText('Email', widget.textEditingEmailController)),
                  ],
                ),

                // //Email
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email notifications', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black)),
                        SizedBox(height: 10),
                        Text('Get emails from us, for example when ad job matching your proifile is posted\non Remote Island or other messages related to your profile.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                      ],
                    )),
                    Obx(() => Expanded(child: Container(
                      alignment: Alignment.centerLeft,
                        child: Checkbox(value: widget.checkboxEmailNoti.value, onChanged: (value){widget.checkboxEmailNoti.value = value!;}))))
                    // RemoteStyle.remoteText('Position', widget.textEditingEmailController),
                  ],
                ),

                //gender
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Gender', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black)),
                        // SizedBox(height: 10),
                        // Text('We never dispaly this on the site, but you use this for logging in. And we forward you messages from employers, as well as you notifications.',
                        //     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                      ],
                    )),
                    Expanded(child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => SizedBox(width: 150, child: RadioListTile(title: const Text('Man'), value: 'Man', groupValue: widget.radioGender.value, onChanged: (value){widget.radioGender.value = value!;}))),
                        Obx(() => SizedBox(width: 150, child: RadioListTile(title: const Text('Woman'), value: 'Woman', groupValue: widget.radioGender.value, onChanged: (value){widget.radioGender.value = value!;})))
                      ],
                    ),),
                  ],
                ),

              ],
            )
        ),
        const SizedBox(height: 40),
        //channel
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
                const Text('Channel', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.8, color: AppColors.black)),

                //Website
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(child: Text('Website', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                    Expanded(child: Row(
                      children: [
                        const Text('https://', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1, color: AppColors.black)),
                        Expanded(child: RemoteStyle.remoteText('website URL', widget.textEditingWebsiteController)),
                      ],
                    )),
                  ],
                ),

                //github
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Row(
                      children: [
                        Image.asset(
                          'assets/images/img_github.png',
                          width: 32,
                          height: 32,
                        ),
                        const SizedBox(width: 10),
                        const Expanded(child: Text('GitHub', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                      ],
                    )),
                    Expanded(child: RemoteStyle.remoteText('GitHub username', widget.textEditingGithubController)),
                  ],
                ),

                //Twitter
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Row(
                      children: [
                        Image.asset(
                          'assets/images/img_twitter.png',
                          width: 32,
                          height: 32,
                        ),
                        const SizedBox(width: 10),
                        const Expanded(child: Text('Twitter', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                      ],
                    )),
                    Expanded(child: RemoteStyle.remoteText('Twitter username', widget.textEditingTwitterController)),
                  ],
                ),

                //LinkedIn URL
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Row(
                      children: [
                        Image.asset(
                          'assets/images/img_linkedin.png',
                          width: 32,
                          height: 32,
                        ),
                        const SizedBox(width: 10),
                        const Expanded(child: Text('LinkedIn URL', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                      ],
                    )),
                    Expanded(child: RemoteStyle.remoteText('LinkedIn username', widget.textEditingLinkedInController)),
                  ],
                ),

                //LinkedIn URL
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Row(
                      children: [
                        Image.asset(
                          'assets/images/img_instagram.png',
                          width: 32,
                          height: 32,
                        ),
                        const SizedBox(width: 10),
                        const Expanded(child: Text('Instagram', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                      ],
                    )),
                    Expanded(child: RemoteStyle.remoteText('Instagram username', widget.textEditingInstagramController)),
                  ],
                ),
              ],
            )
        ),
        const SizedBox(height: 40),
        //work
        Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.grey2, width: 1),
            ),
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Work', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.8, color: AppColors.black)),

                //Bio
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(child: Text('Website', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                    // Expanded(child: Row(
                    //   children: [
                    //     const Text('https://', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1, color: AppColors.black)),
                    //     RemoteStyle.remoteText('website URL', widget.textEditingUserNameController),
                    //   ],
                    // )),
                  ],
                )

              ],
            )
        ),
        const SizedBox(height: 80),






        //foot section
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
                  'Save changes',
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Profile', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.8, color: AppColors.black)),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(child: Text('Username', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                    // Expanded(child: Text('Profile', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.8))),
                  ],
                )
              ],
            )
        ),
        const SizedBox(height: 286)
      ],
    );
  }
}

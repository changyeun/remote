import 'dart:io';
import 'dart:js_interop';

import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/repo/user_repository.dart';
import 'package:crypto_ui_web/screen/widget/remote_style.dart';
import 'package:crypto_ui_web/services/home_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:math';

class ProfileEditView extends StatefulWidget {
  ProfileEditView({super.key});

  //text
  TextEditingController textEditingUserNameController = TextEditingController();
  TextEditingController textEditingEmailController = TextEditingController();
  TextEditingController textEditingWebsiteController = TextEditingController();
  TextEditingController textEditingGithubController = TextEditingController();
  TextEditingController textEditingTwitterController = TextEditingController();
  TextEditingController textEditingLinkedInController = TextEditingController();
  TextEditingController textEditingInstagramController = TextEditingController();
  TextEditingController textEditingBioController = TextEditingController();
  TextEditingController textEditingSkillController = TextEditingController();
  TextEditingController textEditingLanguagesController = TextEditingController();
  TextEditingController textEditingTimezoneController = TextEditingController();
  TextEditingController textEditingAnnualPayController = TextEditingController();
  TextEditingController textEditingHourlyPayController = TextEditingController();

  RxList<TextEditingController> textEditingEmploymentController = <TextEditingController>[].obs;
  RxList<TextEditingController> textEditingSideProjectController = <TextEditingController>[].obs;
  RxList<TextEditingController> textEditingEducationsController = <TextEditingController>[].obs;


  //dropdown
  RxString selectedAccountTypeItem = 'Please Select'.obs;
  RxString selectedLocationItem = 'Please Select'.obs;
  RxString selectedResidencyCountryItem = 'Please Select'.obs;
  RxString selectedNationalityItem = 'Please Select'.obs;

  //radio
  RxString radioGender = 'Man'.obs;
  RxBool checkboxEmailNoti = true.obs;

  //date
  RxBool selectDate = true.obs;
  Rx<DateTime> selectDateTime = Rx<DateTime>(DateTime.now());

  //etc
  RxString selectProfileImage = ''.obs;

  bool isInit = false;

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isInit) {
      TextEditingController textEditingEmploymentController = TextEditingController();
      // textEditingEmploymentController.text = '202305 - 202406 : full stack developer @remote island';
      widget.textEditingEmploymentController.add(textEditingEmploymentController);

      TextEditingController textEditingSideProjectController = TextEditingController();
      // textEditingSideProjectController.text = '202302 - 202401 : side project title, team name';
      widget.textEditingSideProjectController.add(textEditingSideProjectController);

      TextEditingController textEditingEducationsController = TextEditingController();
      // textEditingEducationsController.text = '201902 - 202003 : MA in Art illustration @ Remote island University';
      widget.textEditingEducationsController.add(textEditingEducationsController);
      widget.isInit = true;
    }

    return Column(
      children: [
        Image.asset(
          'assets/images/profile_section_1.png',
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 80),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () async{
              await saveProfile();
            },
            child: Container(
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
                    const SizedBox(width: 10),
                    Expanded(child: RemoteStyle.remoteText('Username', widget.textEditingUserNameController)),
                  ],
                ),

                //Account type
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(child: Text('Account type', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                    const SizedBox(width: 10),
                    Expanded(child: RemoteStyle.remoteDropdown(["I'm a remote worker","I'm hiring remote workers"], widget.selectedAccountTypeItem)),
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
                    const SizedBox(width: 10),
                    Flexible(child:
                    Obx(() => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () async{
                          try {
                            FilePickerResult? result = await FilePicker.platform.pickFiles();
                            if (result != null) {
                              String urlStr = 'profiles/${Random.secure().nextInt(100000)}.png';
                              await Supabase.instance.client.storage
                                  .from('Profile').uploadBinary(urlStr, result.files.single.bytes!, retryAttempts: 3);
                              widget.selectProfileImage.value = Supabase.instance.client.storage.from('Profile').getPublicUrl(urlStr);
                            } else {
                              // 사용자가 파일 선택을 취소한 경우
                              print('User canceled the picker');
                            }
                            // imgUrl
                          } catch (exception, stackTrace) {
                            print(exception);
                            // await FirebaseCrashlytics.instance.recordError(exception, stackTrace);
                          }
                        },
                        child: Container(
                          width: 168,
                          height: 168,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(500),
                              image: widget.selectProfileImage.value == ''?
                                  const DecorationImage(
                                  image: AssetImage('assets/images/image_empty_profile.png'),
                                  fit: BoxFit.fill):
                                  DecorationImage(
                                  image: NetworkImage(widget.selectProfileImage.value),
                                  fit: BoxFit.fill)
                          ),
                        ),
                      ),
                    ))),
                  ],
                ),

                //location
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Location', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black)),
                        SizedBox(height: 10),
                        Text('In which country are you staying now?\nThis helps us connect you to other remote workers there.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                      ],
                    )),
                    const SizedBox(width: 10),
                    Expanded(child: RemoteStyle.remoteDropdown(HomeService.to.locationList, widget.selectedLocationItem)),
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
                    const SizedBox(width: 10),
                    Expanded(child: RemoteStyle.remoteDropdown(HomeService.to.locationList, widget.selectedResidencyCountryItem)),
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
                    const SizedBox(width: 10),
                    Expanded(child: RemoteStyle.remoteDropdown(HomeService.to.locationList, widget.selectedNationalityItem)),
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
                        Text('We never dispaly this on the site, but you use this for logging in.\nAnd we forward you messages from employers, as well as you notifications.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                      ],
                    )),
                    const SizedBox(width: 10),
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
                    const SizedBox(width: 10),
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
                    const SizedBox(width: 10),
                    Expanded(child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => SizedBox(width: 150, child: RadioListTile(title: const Text('Man'), value: 'Man', groupValue: widget.radioGender.value, onChanged: (value){widget.radioGender.value = value!;}))),
                        Obx(() => SizedBox(width: 200, child: RadioListTile(title: const Text('Woman'), value: 'Woman', groupValue: widget.radioGender.value, onChanged: (value){widget.radioGender.value = value!;})))
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
                    const SizedBox(width: 10),
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
                    const SizedBox(width: 10),
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
                    const SizedBox(width: 10),
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
                    const SizedBox(width: 10),
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
                    const SizedBox(width: 10),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Work', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.8, color: AppColors.black)),

                //Bio
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(child: Text('Bio', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                    const SizedBox(width: 10),
                    Expanded(child: RemoteStyle.remoteText('Write a bio about yourself, what your skills are, your experience previously and what you’re looking for (profiles without a bio are not shown on the frontpage)', widget.textEditingBioController, maxLines: 4)),
                  ],
                ),

                //Skills/stack tags (comma separated)
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Skills/stack tags (comma separated)', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black)),
                        SizedBox(height: 10),
                        Text('Use tage like react, js, html, ux, ui, customer support, maketing, frond end,\n'
                            'back end, office365, excel etc. The more/better tags you use the more you\n'
                            'show up one the site! See the Remote Island jobs pages for example tags\n'
                            'in your field to add here.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                      ],
                    )),
                    const SizedBox(width: 10),
                    Expanded(child: RemoteStyle.remoteText('Tags (comma seperated)', widget.textEditingSkillController, maxLines: 4)),
                  ],
                ),

                //Spoken laguages you’re fluent in (comman seperated)
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(child: Text('Spoken laguages you’re fluent in (comman seperated)', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                    const SizedBox(width: 10),
                    Expanded(child: Row(
                      children:  [
                        Expanded(child: RemoteStyle.remoteText('Languages (comma seperated)', widget.textEditingLanguagesController)),
                        const SizedBox(width: 10),
                        const Text('(like Spanish, German, Mandarin)', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))
                      ],
                    )),
                  ],
                ),

                //Available for work
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Available for work', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black)),
                        SizedBox(height: 10),
                        Text('You’ll only be able to receive job offers and get contacted if you’re set to available.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                      ],
                    )),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        children: [
                          Obx(() => Checkbox(value: widget.selectDate.value, onChanged: (value){widget.selectDate.value = value!;})),
                          const SizedBox(width: 10),
                          const Text('form', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1, color: AppColors.black)),
                          const SizedBox(width: 10),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Obx(() => MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () async{
                                    if(widget.selectDate.value){
                                      widget.selectDateTime.value = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(3000)) ?? DateTime.now();
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: 166,
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                    decoration: BoxDecoration(
                                      color: AppColors.mint_light,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child:Text('${widget.selectDateTime.value.year}-${widget.selectDateTime.value.month}-${widget.selectDateTime.value.day}',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3,
                                            color:widget.selectDate.value? AppColors.black: AppColors.grey1)),
                                  ),
                                ),
                              )),

                              Positioned(
                                left: 130,
                                top: 13,
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () async{
                                      if(widget.selectDate.value){
                                        widget.selectDateTime.value = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(3000)) ?? DateTime.now();
                                      }
                                    },
                                    child: Image.asset(
                                      'assets/images/img_calendar.png',
                                      width: 24,
                                      height: 24,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                //Your preferred timezones
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: Text('Your preferred timezones', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RemoteStyle.remoteText('Preferred timezones', widget.textEditingTimezoneController),
                          const SizedBox(height: 10),
                          const Text('Please write these as comma separated list of timezones, like 0, +1, +2, etc.\n'
                              'Otherwise the robot can’t filter on it.',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                        ],
                      ),
                    ),
                  ],
                ),

                // Your preferred annual pay (min)
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: Text('Your preferred annual pay (min)', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('US \$',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                              const SizedBox(width: 10),
                              SizedBox(width: 100, child: RemoteStyle.remoteText('min', widget.textEditingAnnualPayController)),
                              const SizedBox(width: 10),
                              const Text(',000 / year',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Only profiles with annual pay set are shown on the front page. Please write these as US dollars per year in thousands e.g. write 45 for \$45,000/year.\nIf you charge by project/day ur, make an estimate of what you make in a year if it’d be full time and enter that.',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                        ],
                      ),
                    ),
                  ],
                ),

                // Your preferred hourly pay (min)
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: Text('Your preferred hourly pay (min)', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1, color: AppColors.black))),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('US \$',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                              const SizedBox(width: 10),
                              SizedBox(width: 100, child: RemoteStyle.remoteText('min', widget.textEditingHourlyPayController)),
                              const SizedBox(width: 10),
                              const Text(',000 / year',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                            ],
                          ),
                          // const SizedBox(height: 10),
                          // Text('Only profiles with annual pay set are shown on the front page. Please write these as US dollars per year in thousands e.g. write 45 for 45,000/year. If you charge by project/day ur, make an estimate of what you make in a year if it’d be full time and enter that.',
                          //     style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.3, color: AppColors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
        const SizedBox(height: 80),

        //foot section
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
                const Text('Employment', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.8, color: AppColors.black)),
                const SizedBox(height: 30),
                const Text('ex) 202305 - 202406 : full stack developer @remote island', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.1, color: AppColors.black)),
                const SizedBox(height: 30),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.grey2,
                ),
                const SizedBox(height: 30),
                const Text('Please write years and months! Leave year end empty if you still work there (It’ll show as Now).\n'
                    'To remove something, make the textboxes empty (for now).', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.1, color: AppColors.black)),
                const SizedBox(height: 30),

                Obx(() => Column(
                  children: List.generate(widget.textEditingEmploymentController.length,
                      (index) => Column(
                        children: [
                          RemoteStyle.remoteText('Employment', widget.textEditingEmploymentController[index]),
                          const SizedBox(height: 10),
                        ],
                      )),
                )),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap:(){
                            widget.textEditingEmploymentController.add(TextEditingController());
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            decoration: BoxDecoration(
                              color: AppColors.mint,
                              borderRadius: BorderRadius.circular(500),
                            ),
                            child: const Text(
                              'Add a new row',
                              style: TextStyle(fontSize: 14, color: Colors.white, height: 1, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            )
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
                const Text('Side Projects', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.8, color: AppColors.black)),
                const SizedBox(height: 30),
                const Text('ex) 202302 - 202401 : side project title, team name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.1, color: AppColors.black)),
                const SizedBox(height: 30),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.grey2,
                ),
                const SizedBox(height: 30),
                const Text('Please write years and months! You can add your (side) projects and portfolio items here.\n'
                    'Leave year end empty if you still work on it (it’ll show as Now). To remove something, make the textboxes empty (for now).',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.1, color: AppColors.black)),
                const SizedBox(height: 30),

                Obx(() => Column(
                  children: List.generate(widget.textEditingSideProjectController.length,
                          (index) => Column(
                        children: [
                          RemoteStyle.remoteText('Side Projects', widget.textEditingSideProjectController[index]),
                          const SizedBox(height: 10),
                        ],
                      )),
                )),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap:(){
                          widget.textEditingSideProjectController.add(TextEditingController());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          decoration: BoxDecoration(
                            color: AppColors.mint,
                            borderRadius: BorderRadius.circular(500),
                          ),
                          child: const Text(
                            'Add a new row',
                            style: TextStyle(fontSize: 14, color: Colors.white, height: 1, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            )
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
                const Text('Educations', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.8, color: AppColors.black)),
                const SizedBox(height: 30),
                const Text('ex) 201902 - 202003 : MA in Art illustration @ Remote island University', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.1, color: AppColors.black)),
                const SizedBox(height: 30),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.grey2,
                ),
                const SizedBox(height: 30),
                const Text('Please write years and months! Leave year end empty if you still study there (itll show as Now).\nTo remove something, make the textboxes empty (for now).',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.1, color: AppColors.black)),
                const SizedBox(height: 30),

                Obx(() => Column(
                  children: List.generate(widget.textEditingEducationsController.length,
                          (index) => Column(
                        children: [
                          RemoteStyle.remoteText('Educations', widget.textEditingEducationsController[index]),
                          const SizedBox(height: 10),
                        ],
                      )),
                )),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap:(){
                            widget.textEditingEducationsController.add(TextEditingController());
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            decoration: BoxDecoration(
                              color: AppColors.mint,
                              borderRadius: BorderRadius.circular(500),
                            ),
                            child: const Text(
                              'Add a new row',
                              style: TextStyle(fontSize: 14, color: Colors.white, height: 1, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            )
        ),
        const SizedBox(height: 80),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () async{
              await saveProfile();
            },
            child: Container(
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
          ),
        ),
        const SizedBox(height: 286)
      ],
    );
  }

  Future<void> saveProfile() async{
    String employments = '';
    for(int i=0; i < widget.textEditingEmploymentController.length;i++){
      employments += '${widget.textEditingEmploymentController[i].text}/';
    }
    String sideProjects = '';
    for(int i=0; i < widget.textEditingSideProjectController.length;i++){
      sideProjects += '${widget.textEditingSideProjectController[i].text}/';
    }
    String educations = '';
    for(int i=0; i < widget.textEditingEducationsController.length;i++){
      educations += '${widget.textEditingEducationsController[i].text}/';
    }

    await userRepository.createUser(
        HomeService.to.textEditingEmailController.text,
        widget.textEditingUserNameController.text,
        widget.selectedAccountTypeItem.value,
        widget.selectProfileImage.value,
        widget.selectedLocationItem.value,
        widget.selectedResidencyCountryItem.value,
        widget.selectedNationalityItem.value,
        widget.textEditingEmailController.text,
        widget.checkboxEmailNoti.value,
        widget.radioGender.value,
        widget.textEditingWebsiteController.text,
        widget.textEditingGithubController.text,
        widget.textEditingTwitterController.text,
        widget.textEditingLinkedInController.text,
        widget.textEditingInstagramController.text,
        widget.textEditingBioController.text,
        widget.textEditingSkillController.text,
        widget.textEditingLanguagesController.text,
        widget.selectDate.value? widget.selectDateTime.value.toString() : '',
        widget.textEditingTimezoneController.text,
        widget.textEditingAnnualPayController.text,
        widget.textEditingHourlyPayController.text,
        employments, sideProjects, educations);
  }
}

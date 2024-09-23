import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/views/profile_edit_view.dart';
import 'package:crypto_ui_web/screen/widget/remote_style.dart';
import 'package:crypto_ui_web/services/home_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEmailView extends StatefulWidget {
  ProfileEmailView({super.key});
  TextEditingController textEditingPwdController = TextEditingController();

  @override
  State<ProfileEmailView> createState() => _ProfileEmailViewState();
}

class _ProfileEmailViewState extends State<ProfileEmailView> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => HomeService.to.profileType.value == 0
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            const SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Email : '),
                const SizedBox(width: 20),
                SizedBox(
                  width: 300,
                    child: RemoteStyle.remoteText('Email input', HomeService.to.textEditingEmailController)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Password : '),
                const SizedBox(width: 20),
                SizedBox(
                    width: 300,
                    child: RemoteStyle.remoteText('Password input', widget.textEditingPwdController, hide: true)),
              ],
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                if(HomeService.to.textEditingEmailController.text != '' && widget.textEditingPwdController.text != ''){
                  HomeService.to.profileType.value = 1;
                }
              },
              child: Container(
                // margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 15),
                decoration: BoxDecoration(
                  color: AppColors.mint,
                  borderRadius: BorderRadius.circular(500),
                ),
                child: const Text(
                  'Next Profile',
                  style: TextStyle(fontSize: 14, color: Colors.white, height: 1, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 120)
          ])
        : ProfileEditView());
  }
}

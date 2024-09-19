import 'package:crypto_ui_web/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobPostView extends StatefulWidget {
  const JobPostView({super.key});

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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('First, tell us about the position', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.8, color: AppColors.mint)),
                SizedBox(height: 40),

                Text('Job Title', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2, color: AppColors.black)),
                SizedBox(height: 10),
                Text('Ecample: “Senior Designer.” Titles must describe one posiition.',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.2, color: AppColors.grey1)),
                SizedBox(height: 10),

              ],
            )),

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
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.grey2, width: 1),
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

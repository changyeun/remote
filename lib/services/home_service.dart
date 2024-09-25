import 'dart:io';
import 'package:crypto_ui_web/model/job_model.dart';
import 'package:crypto_ui_web/model/user_model.dart';
import 'package:crypto_ui_web/repo/job_repository.dart';
import 'package:crypto_ui_web/repo/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeService extends GetxService {
  static HomeService get to => Get.find();

  RxInt type = 0.obs;
  RxInt profileType = 0.obs;
  RxInt selectJobIndex = 0.obs;

  RxList<UserModel> userModelList =  RxList([]);
  RxList<UserModel> selectUserModelList =  RxList([]);
  RxList<JobModel> jobModelList = RxList([]);
  RxList<JobModel> selectJobModelList = RxList([]);
  RxList<JobModel> selectRecommendJobModelList = RxList([]);
  TextEditingController textEditingEmailController = TextEditingController();

  List<String> categoryList = ['Design','Full-Stack Programming', 'Front-End Programming', 'Back-End Programming',
  'Customer Suport', 'DevOps and Sysadmin', 'Sales and Marketing', 'Management and Finance', 'Legal', 'Product', 'All other Remote'];
  List<String> skillList = ['All', 'Engineer', 'Executive', 'Senior', 'Developer', 'Finance', 'SysAdmin', 'JavaScript', 'Backend', 'Golang',
    'Cloud', 'Medical', 'FrontEnd', 'FullStack', 'Ops', 'Design', 'React', 'InfoSec', 'Marketing', 'Mobile', 'ContentWriting',
    'Saas', 'Recruiter', 'API', 'Sales', 'Ruby', 'Education', 'DevOps', 'Stats', 'Python', 'Node', 'English', 'NonTech', 'Video',
    'Travel', 'QualityAssurance', 'Ecommerce', 'Teaching', 'Linux', 'Java', 'Crypto', 'Junior', 'Git', 'Legal', 'Android', 'Accounting',
    'Admin', 'Microsoft', 'Excel', 'PHP'];
  List<String> homeSkillList = [];
  List<String> locationList = ['Abkhazia', 'Albania', 'Algeria', 'Andorra', 'Angola', 'Antigua and Barbuda', 'Argentina', 'Armenia', 'Australia',
    'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium', 'Belize', 'Benin', 'Bhutan', 'Bolivia', 'Bosnia and Herz,egovina', 'Botswana',
    'Brazil', 'Brunei', 'Bulgaria', 'Burkina Faso', 'Burundi', 'Cambodia', 'Cameroon', 'Canadart', 'Cape Verde', 'Central African Republic',
    'Chad', 'Chile', 'China', 'Colombia,', 'Comoros', 'Costa Rica', 'Croatia', 'Cuba', 'Cyprus', 'Czech Republic', 'Democratic Republic of the Congo',
    'Denmark', 'Djibouti', 'Dominica', 'Dominican Republic', 'East Timor', 'Ecuador', 'Egypt', 'El Salvador', 'Equatorial Guinea', 'Eritrea', 'Estonia',
    'Eswatini', 'Ethiopia', 'Fiji', 'Finland', 'France', 'Gabon', 'Georgia', 'Germany', 'Ghana', 'Greece', 'Grenada', 'Guatemala', 'Guinea',
    'Guinea-Bissau', 'Guyana', 'Haiti', 'Honduras', 'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran', 'Ireland', 'Islamic Emirate of Afghanistan',
    'Israel', 'Italy', 'Ivory Coast', 'Jamaica', 'Japan', 'Jordan', 'Kazakhstan', 'Kenya', 'Kiribati', 'Kosovo', 'Kuwait', 'Kyrgyzstan',
    'Laos', 'Latvia', 'Lebanon', 'Lesotho', 'Liberia', 'Libya', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Madagascar', 'Malawi',
    'Malaysia', 'Maldives', 'Mali', 'Malta', 'Marshall Islands', 'Mauritania', 'Mauritius', 'Mexico', 'Micronesia',
    'Moldova', 'Monaco', 'Mongolia', 'Montenegro', 'Morocco', 'Mozambique', 'Myanmar', 'Namibia', 'Nauru', 'Nepal', 'Netherlands', 'New Zealand',
    'Nicaragua', 'Niger', 'Nigeria', 'North Korea', 'North Macedonia', 'Northern Cyprus', 'Norway', 'Oman', 'Pakistan', 'Palau',
    'Palestine', 'Panama', 'Papua New Guinea', 'Paraguay','Peru', 'Philippines', 'Poland', 'Portugal', 'Qatar', 'Republic of the Congo',
    'Romania', 'Russia', 'Rwanda', 'Sahrawi Arab Democratic Republic', 'Saint Kitts and Nevis', 'Saint Lucia', 'Saint Vincent and the Grenadines',
    'Samoa', 'San Marino', 'São Tomé and Príncipe', 'Saudi Arabia', 'Senegal', 'Serbia', 'Seychelles', 'Sierra Leone', 'Singapore', 'Slovakia', 'Slovenia',
    'Solomon Islands', 'Somalia', 'Somaliland', 'South Africa', 'South Ossetia', 'South Sudan', 'Sovereign Military Order of Malta[x]', 'Spain', 'Sri Lanka', 'Sudan', 'Suriname',
    'Sweden', 'Switzerland', 'Syria', 'Taiwan', 'Tajikistan,', 'Tanzania', 'Thailand', 'The Gambia', 'Togo', 'Tonga', 'Transnistria', 'Trinidad and Tobago',
    'Tunisia', 'Turkey', 'Turkmenistan', 'Tuvalu', 'Uganda', 'Ukraine', 'United Arab Emirates', 'United Kingdom', 'United States', 'Uruguay', 'Uzbekistan',
    'Vanuatu', 'Vatican City', 'Venezuela', 'Vietnam', 'Yemen', 'Zambia', 'Zimbabwe'];
  List<String> salaryList = ['\$10,000 - \$25,000 USD', '\$25,000 - \$48,999 USD', '\$50,000 - \$74,999 USD', '\$75,000 - \$99,999 USD', '\$100,000 or more USD'];

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    homeSkillList = skillList;
    homeSkillList.removeAt(0);
    await Future.wait([
      getUserModel(),
      getJobModel()
    ]);

  }

  Future<void> getUserModel() async{
    selectUserModelList.value = [];
    userModelList.value = await userRepository.getUserModel();
    for(int i=0;i<userModelList.length;i++){
      selectUserModelList.add(userModelList[i]);
    }
  }

  Future<void> getJobModel() async{
    selectJobModelList.value = [];
    jobModelList.value = await jobsRepository.getJobsModel();
    for(int i=0;i<jobModelList.length;i++){
      selectJobModelList.add(jobModelList[i]);
    }
  }

  Future<void> recommendJobList(String id, String skill) async{
    selectRecommendJobModelList.value = [];
    for(int i=0;i<jobModelList.length;i++){
      if(jobModelList[i].id == id){
        selectJobIndex.value = i;
      }
      if(jobModelList[i].skill == skill && skill != ''){
        selectRecommendJobModelList.add(jobModelList[i]);
      }
    }
  }
}

class UserModel {
  String? id;
  DateTime createdAt;
  String? email;
  String? userName;
  String? accountType;
  String? profilePhoto;
  String? location;
  String? residencyCountry;
  String? nationality;
  String? emailInfo;
  bool? emailNoti;
  String? gender;
  String? webSite;
  String? github;
  String? twitter;
  String? linkedIn;
  String? insta;
  String? bio;
  String? skills;
  String? languages;
  String? availableWork;
  String? timezones;
  String? annualPay;
  String? hourlyPay;
  String? employments;
  String? sideProjects;
  String? educations;

  UserModel.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? 0,
        createdAt =  DateTime.parse(map['created_at']),
        email = map['email'] ?? '',
        userName = map['userName'] ?? '',
        accountType = map['accountType'] ?? '',
        profilePhoto = map['profilePhoto'] ?? '',
        location = map['location'] ?? '',
        residencyCountry = map['residencyCountry'] ?? '',
        nationality = map['nationality'] ?? '',
        emailInfo = map['emailInfo'] ?? '',
        emailNoti = map['emailNoti'] ?? false,
        gender = map['gender'] ?? '',
        webSite = map['webSite'] ?? '',
        github = map['github'] ?? '',
        twitter = map['twitter'] ?? '',
        linkedIn = map['linkedIn'] ?? '',
        insta = map['insta'] ?? '',
        bio = map['bio'] ?? '',
        skills = map['skills'] ?? '',
        languages = map['languages'] ?? '',
        availableWork = map['availableWork'] ?? '',
        timezones = map['timezones'] ?? '',
        annualPay = map['annualPay'] ?? '',
        hourlyPay = map['hourlyPay'] ?? '',
        employments = map['employments'] ?? '',
        sideProjects = map['sideProjects'] ?? '',
        educations = map['educations'] ?? '';

  static List<UserModel> fromMapList(List<dynamic>? mapList) {
    List<UserModel> results = [];

    if (mapList != null) {
      for (Map<String, dynamic> map in mapList) {
        UserModel model = UserModel.fromMap(map);
        results.add(model);
      }
    }

    return results;
  }
}

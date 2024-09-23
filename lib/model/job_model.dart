class JobModel {
  String? id;
  DateTime createdAt;
  String? title;
  String? category;
  String? skill;
  String? worldWide;
  String? salaryRange;
  String? jobType;
  String? linkOrEmail;
  String? location;
  String? aboutRole;
  String? responsibility;
  String? qualifications;
  String? benefits;
  String? companyName;
  String? companyHQ;
  String? photo;
  String? website;
  String? email;
  String? des;

  JobModel.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? 0,
        createdAt =  DateTime.parse(map['created_at']),
        title =  map['title'] ?? '',
        category =  map['category'] ?? '',
        skill =  map['skill'] ?? '',
        worldWide =  map['worldWide'] ?? '',
        salaryRange =  map['salaryRange'] ?? '',
        jobType =  map['jobType'] ?? '',
        linkOrEmail =  map['linkOrEmail'] ?? '',
        location =  map['location'] ?? '',
        aboutRole =  map['aboutRole'] ?? '',
        responsibility =  map['responsibility'] ?? '',
        qualifications =  map['qualifications'] ?? '',
        benefits =  map['benefits'] ?? '',
        companyName =  map['companyName'] ?? '',
        companyHQ =  map['companyHQ'] ?? '',
        photo =  map['photo'] ?? '',
        website =  map['website'] ?? '',
        email =  map['title'] ?? '',
        des =  map['des'] ?? '';

  static List<JobModel> fromMapList(List<dynamic>? mapList) {
    List<JobModel> results = [];

    if (mapList != null) {
      for (Map<String, dynamic> map in mapList) {
        JobModel model = JobModel.fromMap(map);
        results.add(model);
      }
    }

    return results;
  }

}

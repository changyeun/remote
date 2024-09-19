class JobModel {
  String? id;
  DateTime createdAt;
  String? name;

  JobModel.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? 0,
        createdAt =  DateTime.parse(map['created_at']),
        name = map['name'] ?? '';

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

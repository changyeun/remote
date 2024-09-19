class UserModel {
  String? id;
  DateTime createdAt;
  String? name;

  UserModel.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? 0,
        createdAt =  DateTime.parse(map['created_at']),
        name = map['name'] ?? '';

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

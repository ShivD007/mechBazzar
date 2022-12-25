/// message : "Successfully got app version!"
/// status : true
/// entity : {"forceUpdate":false}
/// forceUpdate : false

class AppUpdateResModel {
  AppUpdateResModel({
      this.forceUpdate,});

  AppUpdateResModel.fromJson(dynamic json) {
    forceUpdate = json['forceUpdate'];
    versionNo=json["latestVersion"];
  }
  bool? forceUpdate;
  String? versionNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['forceUpdate'] = forceUpdate;
    map['latestVersion'] = versionNo;
    return map;
  }

}
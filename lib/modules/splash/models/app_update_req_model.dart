/// versionName : "1.1.0"
/// os : "ios"

class AppUpdateReqModel {
  AppUpdateReqModel({
      this.versionName, 
      this.os,});

  AppUpdateReqModel.fromJson(dynamic json) {
    versionName = json['versionName'];
    os = json['os'];
  }
  String? versionName;
  String? os;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['versionName'] = versionName;
    map['os'] = os;
    return map;
  }

}
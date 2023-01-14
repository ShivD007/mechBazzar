class UserModel {
  int? id;
  int? userType;
  String? name;
  String? email;
  String? address;
  String? phone;
  String? photo;
  String? createdAt;

  UserModel(
      {this.id,
      this.userType,
      this.name,
      this.email,
      this.address,
      this.phone,
      this.photo,
      this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['user_type'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    photo = json['photo'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_type'] = this.userType;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class UserModel {
  UserModel({
      this.name, 
      this.email, 
      this.phoneNo, 
      this.fcmToken, 
      this.password, 
      this.id,});

  UserModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phoneNo = json['phone_no'];
    fcmToken = json['fcm_token'];
    password = json['password'];
    id = json['id'];
  }
  String? name;
  String? email;
  String? phoneNo;
  String? fcmToken;
  String? password;
  int? id;
UserModel copyWith({  String? name,
  String? email,
  String? phoneNo,
  String? fcmToken,
  String? password,
  int? id,
}) => UserModel(  name: name ?? this.name,
  email: email ?? this.email,
  phoneNo: phoneNo ?? this.phoneNo,
  fcmToken: fcmToken ?? this.fcmToken,
  password: password ?? this.password,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone_no'] = phoneNo;
    map['fcm_token'] = fcmToken;
    map['password'] = password;
    map['id'] = id;
    return map;
  }

}
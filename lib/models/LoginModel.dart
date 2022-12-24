import 'package:slang_app_user/models/UserModel.dart';

class LoginModel {
  LoginModel({
      this.success, 
      this.message, 
      this.data, 
      this.token,});

  LoginModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
    token = json['token'];
  }
  bool? success;
  String? message;
  UserModel? data;
  String? token;
LoginModel copyWith({  bool? success,
  String? message,
  UserModel? data,
  String? token,
}) => LoginModel(  success: success ?? this.success,
  message: message ?? this.message,
  data: data ?? this.data,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

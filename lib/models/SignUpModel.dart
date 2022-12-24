import 'package:slang_app_user/models/UserModel.dart';

class SignUpModel {
  SignUpModel({
    this.status,
    this.message,
    this.data,
    this.token,
  });

  SignUpModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
    token = json['token'];
  }

  bool? status;
  String? message;
  UserModel? data;
  String? token;

  SignUpModel copyWith({
    bool? status,
    String? message,
    UserModel? data,
    String? token,
  }) =>
      SignUpModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        token: token ?? this.token,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    return map;
  }
}


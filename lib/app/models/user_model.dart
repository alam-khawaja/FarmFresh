import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_your_food/global/enums/user_role.dart';

class UserModel {
  final String? uid;
  final String? email;
  final String? password;
  final String? userName;
  final String? phoneNo;
  final String? profileAvatar;
  final UserRole? role;
  final Timestamp? createdAt;

  UserModel({
    this.uid,
    this.email,
    this.password,
    this.userName,
    this.phoneNo,
    this.profileAvatar,
    this.role,
    this.createdAt,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? password,
    String? userName,
    String? phoneNo,
    String? profileAvatar,
    UserRole? role,
    Timestamp? createdAt,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      userName: userName ?? this.userName,
      phoneNo: phoneNo ?? this.phoneNo,
      profileAvatar: profileAvatar ?? this.profileAvatar,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory UserModel.empty() {
      return UserModel(
      uid: '',
      email: '',
      password: '',
      userName: '',
      phoneNo: '',
      profileAvatar: null,
      role: UserRole.none,
      createdAt: Timestamp.now(),
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      userName: json['userName'] as String?,
      phoneNo: json['phoneNo'] as String?,
      profileAvatar: json['profileAvatar'] as String?,
      role:  UserRole.fromString(json['role']),
      createdAt: json['createdAt'] as Timestamp?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'userName': userName,
      'phoneNo': phoneNo,
      'profileAvatar': profileAvatar,
      'role': role!.name,
      'createdAt': createdAt,
    };
  }
}

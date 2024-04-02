import 'dart:convert';

class UserModel {
  String? uid;
  String? name;
  String? profile;
  String? email;
  String? phone;
  String? gender;
  String? dob;

  UserModel({
    this.name,
    this.uid,
    this.email,
    this.profile,
    this.phone,
    this.gender,
    this.dob,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'email': email,
      'phone': phone,
      'profile': profile,
      'gender': gender,
      'dob': dob,
    };
  }

  static UserModel initialUser = UserModel(
    dob: "",
    email: "",
    gender: "",
    name: "",
    phone: "",
    profile: "",
    uid: "",
  );

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String?,
      uid: map['uid'] as String?,
      email: map['email'] as String?,
      phone: map['phone'] as String?,
      profile: map['profile'] as String?,
      gender: map['gender'] as String?,
      dob: map['dob'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

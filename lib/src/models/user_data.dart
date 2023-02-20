import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final String userId;
  final String userName;
  final String email;
  final String profilePicUrl;

  const UserData({
    required this.userId,
    required this.userName,
    required this.email,
    required this.profilePicUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

class UserContactModel {
  final String userName;
  final String userPhoneNumber;

  UserContactModel({
    required this.userName,
    required this.userPhoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userPhoneNumber': userPhoneNumber,
    };
  }

  factory UserContactModel.fromMap(Map<dynamic, dynamic> map) {
    return UserContactModel(
      userName: map['userName'] ?? '',
      userPhoneNumber: map['userPhoneNumber'] ?? '',
    );
  }
}

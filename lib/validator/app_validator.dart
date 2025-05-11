class AppValidators {
  // Username validator
  static String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username cannot be empty';
    }

    if (value.length < 3) {
      return 'Username must be at least 3 characters long';
    }
    return null;
  }

  // Phone number validator
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }

    final phoneRegExp = RegExp(r'^\+?[1-9]\d{1,14}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }
}

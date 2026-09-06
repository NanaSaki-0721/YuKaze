bool isValidPanelEmail(String? email) {
  if (email == null || email.isEmpty) {
    return false;
  }
  return RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(email);
}

String? validatePanelPassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'panelPasswordRequired';
  }
  if (password.length < 8) {
    return 'panelPasswordTooShort';
  }
  return null;
}

String? validatePanelConfirmPassword(
  String? password,
  String? confirmPassword,
) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'panelConfirmPasswordRequired';
  }
  if (password != confirmPassword) {
    return 'panelPasswordsDoNotMatch';
  }
  return null;
}

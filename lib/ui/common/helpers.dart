bool validateEmail(String email) {
  // Regular expression for email validation
  String emailPattern =
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // This regex matches most common email formats

  RegExp regExp = RegExp(emailPattern);

  return regExp.hasMatch(email);
}
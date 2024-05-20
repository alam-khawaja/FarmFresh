class Validations {
  static bool emailValidation(String em) {
    String p =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  static bool emailValidationWidthDomain(String em) {
    String p =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)+$";
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  static String? passwordValidation(value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter password";
    } else if (value.replaceAll(RegExp(r"\s+"), "").length < 6) {
      return "Password should be at least 6 characters";
    } else {
      return null;
    }
  }

  static String? commonValidation(value, {message, message2, length}) {
    int len = length ?? 5;
    if (value == null || value.trim().isEmpty) {
      return message ?? "required";
    } else if (value.replaceAll(RegExp(r"\s+"), "").length < len) {
      return message2 ?? "Characters should be at least $len digits";
    } else {
      return null;
    }
  }

  static String? messageValidation(value) {
    if (value == null || value.trim().isEmpty) {
      return "required";
    } else if (value.replaceAll(RegExp(r"\s+"), "").length < 1) {
      return "required";
    } else {
      return null;
    }
  }

  static String? nameValidation(value, {message, message2, length}) {
    int len = length ?? 5;
    if (value == null || value.trim().isEmpty) {
      return message ?? "required";
    } else if (value.replaceAll(RegExp(r"\s+"), "").length < len) {
      return message2 ?? "Characters should be at least 5 digits";
    } else if (value.replaceAll(" ", "").length > 25) {
      return "Maximum character limit exceeded (25 characters)";
    } else {
      return null;
    }
  }

  static bool validatePhoneNumber(String phoneNumber) {
    // Define the regular expression for phone number validation
    RegExp regExp = RegExp(r'^\+\d{1,2}\d{1,11}$');

    // Perform the validation
    if (regExp.hasMatch(phoneNumber)) {
      return true;
    } else {
      return false;
    }
  }
}

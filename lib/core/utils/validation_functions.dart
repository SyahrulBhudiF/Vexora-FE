bool isText(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;
  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = true;
  }
  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[a-zA-Z]+$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  return isInputStringValid;
}

bool isValidPassword(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;
  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = true;
  }
  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  return isInputStringValid;
}

bool isValidEmail(String? inputString, {bool isRequired = false}) {
  // Jika isRequired false dan inputString kosong, dianggap valid
  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    return true;
  }

  // Jika inputString ada dan tidak kosong, lakukan validasi email
  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'; // Pola email lebih ketat
    final regExp = RegExp(pattern);
    return regExp.hasMatch(inputString); // Mengembalikan hasil match
  }

  // Jika tidak memenuhi syarat, kembalikan false
  return false;
}

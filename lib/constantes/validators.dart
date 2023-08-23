extension PhoneValidator on String {
  bool isValidPhone() {
    return RegExp(r'^(0?|(00|\+)?(213|216))[56789]\d{8}$').hasMatch(this);
  }

  String transformAndValidatePhone() {
    if (isValidPhone()) {
      if (startsWith('+213')) {
        return replaceFirst('+213', '0');
      } else if (startsWith('+216')) {
        return replaceFirst('+216', '0');
      } else {
        return this; // Return unchanged
      }
    } else {
      return this;
    }
  }
}

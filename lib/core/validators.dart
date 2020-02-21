class Validator {
  bool emailValidator(String data) {
    return RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
    ).hasMatch(data);
  }

  bool pwdValidator(String data) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(data);
  }

  bool nameValidator(String data) {
    return data.length > 8;
  }

  bool phoneValidator(String data) {
    return RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(data);
  }
}

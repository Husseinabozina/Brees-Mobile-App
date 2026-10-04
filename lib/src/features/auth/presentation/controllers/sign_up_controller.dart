import 'package:flutter/material.dart';

import '../../domain/entities/registration_draft.dart';
import '../../domain/usecases/register_user.dart';

class SignUpController extends ChangeNotifier {
  SignUpController(this._registerUser);

  final RegisterUser _registerUser;

  final name = TextEditingController(text: 'Louis Real');
  final email = TextEditingController(text: 'Louis04real@gmail.com');
  final password = TextEditingController(text: 'portfolio123');

  bool acceptedTerms = false;
  bool obscurePassword = true;
  bool isSubmitting = false;

  void toggleTerms() {
    acceptedTerms = !acceptedTerms;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<bool> submit() async {
    if (isSubmitting) return false;
    isSubmitting = true;
    notifyListeners();

    try {
      await _registerUser(
        RegistrationDraft(
          name: name.text,
          email: email.text,
          password: password.text,
          acceptedTerms: acceptedTerms,
        ),
      );
      return true;
    } on FormatException {
      return false;
    } finally {
      isSubmitting = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}

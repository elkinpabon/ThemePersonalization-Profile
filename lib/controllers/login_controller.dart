import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // Simular login
  Future<bool> login() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // Simulamos una petición al servidor
    await Future.delayed(const Duration(seconds: 2));

    // Validación simple para demo
    if (emailController.text == 'elkin@espe.edu.ec' &&
        passwordController.text == '123456') {
      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _errorMessage = 'Credenciales incorrectas';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

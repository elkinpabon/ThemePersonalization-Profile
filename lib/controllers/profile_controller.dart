import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileController extends ChangeNotifier {
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Cargar perfil del usuario
  Future<void> loadUserProfile() async {
    _isLoading = true;
    notifyListeners();

    // Simulamos carga de datos
    await Future.delayed(const Duration(seconds: 1));

    // Datos personalizados de Elkin Andres Pabon Gonzalez
    _currentUser = UserModel(
      fullName: 'Elkin Andres Pabon Gonzalez',
      email: 'elkin@espe.edu.ec',
      career: 'Ingeniería en Software',
      semester: '6to Semestre',
      university: 'ESPE - Escuela Politécnica del Ejército',
      location: 'Quito, Ecuador',
      photoUrl: 'assets/images/profile.jpg',
      bio:
          'Estudiante apasionado por el desarrollo de software, '
          'especializado en desarrollo móvil con Flutter y tecnologías web modernas. '
          'Enfocado en crear aplicaciones innovadoras y de alto impacto.',
    );

    _isLoading = false;
    notifyListeners();
  }

  // Actualizar perfil
  Future<void> updateProfile(UserModel updatedUser) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _currentUser = updatedUser;
    _isLoading = false;
    notifyListeners();
  }

  // Cerrar sesión
  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}

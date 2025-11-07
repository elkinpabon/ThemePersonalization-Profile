import 'package:flutter/material.dart';
import '../../controllers/login_controller.dart';
import '../../controllers/profile_controller.dart';
import '../../ui/atoms/buttons/primary_button.dart';
import '../../ui/molecules/forms/login_form.dart';
import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = LoginController();
  final ProfileController _profileController = ProfileController();

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final success = await _loginController.login();

    if (success && mounted) {
      // Cargar el perfil del usuario
      await _profileController.loadUserProfile();

      // Navegar a la página de perfil
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              ProfilePage(profileController: _profileController),
        ),
      );
    } else if (mounted) {
      // Mostrar mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _loginController.errorMessage ?? 'Error al iniciar sesión',
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo o icono
                Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 24),

                // Título
                Text(
                  'Bienvenido',
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                // Subtítulo
                Text(
                  'Inicia sesión para continuar',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                // Formulario de login
                LoginForm(
                  emailController: _loginController.emailController,
                  passwordController: _loginController.passwordController,
                  formKey: _loginController.formKey,
                ),
                const SizedBox(height: 24),

                // Botón de login
                ListenableBuilder(
                  listenable: _loginController,
                  builder: (context, child) {
                    return PrimaryButton(
                      text: 'Iniciar Sesión',
                      onPressed: _handleLogin,
                      isLoading: _loginController.isLoading,
                      icon: Icons.login,
                    );
                  },
                ),
                const SizedBox(height: 16),

                // Texto de ayuda
                TextButton(
                  onPressed: () {
                    // Mostrar credenciales de demo
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Credenciales de Demo'),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email: elkin@espe.edu.ec'),
                            Text('Contraseña: 123456'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cerrar'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('¿Olvidaste tu contraseña?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

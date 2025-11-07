import 'package:flutter/material.dart';
import '../../controllers/profile_controller.dart';
import '../../ui/organisms/profile/profile_header.dart';
import '../../ui/organisms/profile/profile_info_section.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  final ProfileController profileController;

  const ProfilePage({super.key, required this.profileController});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // Si no hay usuario cargado, cargar el perfil
    if (widget.profileController.currentUser == null) {
      widget.profileController.loadUserProfile();
    }
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cerrar Sesión'),
        content: const Text('¿Estás seguro que deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              widget.profileController.logout();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            child: const Text('Cerrar Sesión'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _handleLogout,
            tooltip: 'Cerrar sesión',
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: widget.profileController,
        builder: (context, child) {
          if (widget.profileController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final user = widget.profileController.currentUser;
          if (user == null) {
            return const Center(child: Text('No se pudo cargar el perfil'));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                // Header con avatar y nombre
                ProfileHeader(user: user),
                const SizedBox(height: 16),

                // Sección de información
                ProfileInfoSection(user: user),
                const SizedBox(height: 24),

                // Botones de acción
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.edit),
                          title: const Text('Editar Perfil'),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Función de edición en desarrollo',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.settings),
                          title: const Text('Configuración'),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Función de configuración en desarrollo',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}

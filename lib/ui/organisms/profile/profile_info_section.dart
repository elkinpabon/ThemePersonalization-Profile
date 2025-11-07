import 'package:flutter/material.dart';
import '../../../models/user_model.dart';
import '../../molecules/cards/info_card.dart';

// Sección de información del perfil
class ProfileInfoSection extends StatelessWidget {
  final UserModel user;

  const ProfileInfoSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Información Personal',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        InfoCard(
          icon: Icons.school,
          title: 'Universidad',
          value: user.university,
          iconColor: Theme.of(context).colorScheme.secondary,
        ),
        InfoCard(
          icon: Icons.calendar_today,
          title: 'Semestre',
          value: user.semester,
          iconColor: Theme.of(context).colorScheme.tertiary,
        ),
        InfoCard(
          icon: Icons.location_on,
          title: 'Ubicación',
          value: user.location,
          iconColor: Colors.red,
        ),
        InfoCard(
          icon: Icons.email,
          title: 'Correo',
          value: user.email,
          iconColor: Colors.orange,
        ),
        if (user.bio != null && user.bio!.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Sobre mí',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                user.bio!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

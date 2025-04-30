import 'package:flutter/material.dart';
import 'package:flutter_basico/services/preference_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
      actions: [
        IconButton(
          onPressed: () {
            PreferenceService.logout();

            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('/login', (route) => true);
          },
          icon: Icon(Icons.logout),
        ),
      ],
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Altura padrão da AppBar
}

import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:flutter/material.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments
            as AuthUserEntity; // dynamic type
    return Scaffold(
      appBar: AppBar(title: const Text('Homepage')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username :${args.username}',
              style: const TextStyle(fontSize: 18),
            ),
            Text('Email: ${args.email}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('ID: ${args.id}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

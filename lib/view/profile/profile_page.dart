import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/authentication_controller.dart';

class ProfilePage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Obx(() {
        final userDetails = authController.userDetails.value;

        if (userDetails == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                CircleAvatar(
                  radius: 50,
                  // backgroundImage: AssetImage('assets/profile_placeholder.png'),
                  backgroundColor: context.theme.colorScheme.secondary,
                ),
                const SizedBox(height: 16),
                Text(
                  userDetails['name'] ?? 'No Name',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  userDetails['email'] ?? 'No Email',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 32),
                FilledButton(
                  onPressed: () => authController.logout(),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}

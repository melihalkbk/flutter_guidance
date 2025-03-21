import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade100, Colors.white],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Settings Categories
                  _buildSettingsCategory(context, "Preferences", [
                    _buildSettingItem(
                      context,
                      Icons.notifications_outlined,
                      "Notifications",
                      "Manage app notifications",
                      onTap: () {
                        // Navigate to notifications settings
                      },
                    ),
                    _buildSettingItem(
                      context,
                      Icons.language,
                      "Language",
                      "Change app language",
                      onTap: () {
                        // Navigate to language settings
                      },
                    ),
                  ]),

                  _buildSettingsCategory(context, "App", [
                    _buildSettingItem(
                      context,
                      Icons.info_outline,
                      "About",
                      "App information and version",
                      onTap: () {
                        _showAboutDialog(context);
                      },
                    ),
                    _buildSettingItem(
                      context,
                      Icons.privacy_tip_outlined,
                      "Privacy Policy",
                      "How we handle your data",
                      onTap: () {
                        // Navigate to privacy policy
                      },
                    ),
                    _buildSettingItem(
                      context,
                      Icons.help_outline,
                      "Help & Support",
                      "Get assistance with app features",
                      onTap: () {
                        // Navigate to help page
                      },
                    ),
                  ]),

                  _buildSettingsCategory(context, "Account", [
                    _buildSettingItem(
                      context,
                      Icons.security,
                      "Security",
                      "Manage account security",
                      onTap: () {
                        // Navigate to security settings
                      },
                    ),
                    _buildSettingItem(
                      context,
                      Icons.logout,
                      "Sign Out",
                      "Sign out from your account",
                      onTap: () async {
                        try {
                          await FirebaseAuth.instance.signOut();
                          // Navigate to login page
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/login',
                            (route) => false,
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error signing out: $e')),
                          );
                        }
                      },
                      iconColor: Colors.red,
                    ),
                  ]),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsCategory(
    BuildContext context,
    String title,
    List<Widget> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(children: items),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildSettingItem(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle, {
    Widget? trailing,
    VoidCallback? onTap,
    Color? iconColor,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (iconColor ?? Colors.blue).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor ?? Colors.blue),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("About Flutter Guidance"),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Version: 1.0.0"),
                SizedBox(height: 8),
                Text(
                  "Flutter Guidance is a comprehensive app designed to help users learn Flutter through interactive quizzes and exercises.",
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close"),
              ),
            ],
          ),
    );
  }
}

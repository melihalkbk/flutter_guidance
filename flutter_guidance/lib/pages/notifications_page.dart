import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _quizReminders = true;
  bool _newContent = true;
  bool _weeklyDigest = false;
  bool _tips = true;
  bool _achievements = true;

  @override
  void initState() {
    super.initState();
    _loadNotificationPreferences();
  }

  Future<void> _loadNotificationPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _quizReminders = prefs.getBool('quiz_reminders') ?? true;
      _newContent = prefs.getBool('new_content') ?? true;
      _weeklyDigest = prefs.getBool('weekly_digest') ?? false;
      _tips = prefs.getBool('tips') ?? true;
      _achievements = prefs.getBool('achievements') ?? true;
    });
  }

  Future<void> _saveNotificationPreference(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'), elevation: 0),
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
                    "Notification Settings",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Choose which notifications you'd like to receive",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 24),

                  _buildNotificationCategory(context, "Learning", [
                    _buildNotificationSwitch(
                      "Quiz Reminders",
                      "Reminders to complete your daily quizzes",
                      _quizReminders,
                      (value) {
                        setState(() => _quizReminders = value);
                        _saveNotificationPreference('quiz_reminders', value);
                      },
                    ),
                    _buildNotificationSwitch(
                      "New Content",
                      "Alerts when new quizzes or lessons are available",
                      _newContent,
                      (value) {
                        setState(() => _newContent = value);
                        _saveNotificationPreference('new_content', value);
                      },
                    ),
                    _buildNotificationSwitch(
                      "Weekly Digest",
                      "Weekly summary of your learning progress",
                      _weeklyDigest,
                      (value) {
                        setState(() => _weeklyDigest = value);
                        _saveNotificationPreference('weekly_digest', value);
                      },
                    ),
                  ]),

                  _buildNotificationCategory(context, "Engagement", [
                    _buildNotificationSwitch(
                      "Flutter Tips",
                      "Helpful tips and tricks for Flutter development",
                      _tips,
                      (value) {
                        setState(() => _tips = value);
                        _saveNotificationPreference('tips', value);
                      },
                    ),
                    _buildNotificationSwitch(
                      "Achievements",
                      "Notifications about your achievements and milestones",
                      _achievements,
                      (value) {
                        setState(() => _achievements = value);
                        _saveNotificationPreference('achievements', value);
                      },
                    ),
                  ]),

                  const SizedBox(height: 24),

                  _buildGeneralNotificationSettings(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCategory(
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

  Widget _buildNotificationSwitch(
    String title,
    String description,
    bool value,
    Function(bool) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged, activeColor: Colors.blue),
        ],
      ),
    );
  }

  Widget _buildGeneralNotificationSettings(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                "About Device Notifications",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "App notifications can also be controlled in your device settings. If you're not receiving notifications, please check your device settings.",
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Opening device settings...')),
              );
            },
            icon: const Icon(Icons.settings),
            label: const Text("Open Device Settings"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              minimumSize: const Size(double.infinity, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Support'), centerTitle: true),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6D7BF8), Color(0xFF9DC8FF)],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 28,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.headset_mic,
                          color: Color(0xFF5563F5),
                          size: 40,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Need help? We’re here for you.',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Get fast support for account issues, task management, and app features. Browse topics or contact us directly.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Color(0xFF4A4A4A),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        _SupportActionCard(
                          icon: Icons.chat_bubble_outline,
                          title: 'Live Chat',
                          subtitle: 'Start a conversation',
                          background: Color(0xFFEDF2FF),
                        ),
                        const SizedBox(width: 12),
                        _SupportActionCard(
                          icon: Icons.mail_outline,
                          title: 'Email Us',
                          subtitle: 'support@example.com',
                          background: Color(0xFFFFF6E4),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Popular Topics',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              _SupportTopicCard(
                icon: Icons.lock_outline,
                title: 'Account access',
                description: 'Recover your password and sign in securely.',
              ),
              _SupportTopicCard(
                icon: Icons.task_alt_outlined,
                title: 'Task management',
                description: 'Organize tasks, reminders, and schedules.',
              ),
              _SupportTopicCard(
                icon: Icons.settings_outlined,
                title: 'App settings',
                description: 'Change preferences, notifications, and themes.',
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Support Hours',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Monday - Friday: 9:00 AM - 8:00 PM'),
                    SizedBox(height: 4),
                    Text('Saturday: 10:00 AM - 4:00 PM'),
                    SizedBox(height: 8),
                    Text(
                      'We aim to respond within 24 hours. For urgent issues, use Live Chat.',
                      style: TextStyle(color: Color(0xFF606060)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SupportActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color background;

  const _SupportActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.black87, size: 24),
            ),
            const SizedBox(height: 18),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Color(0xFF5F5F5F)),
            ),
          ],
        ),
      ),
    );
  }
}

class _SupportTopicCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _SupportTopicCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF2FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFF5C6BF1), size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF5F5F5F),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

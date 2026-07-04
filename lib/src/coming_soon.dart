import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              'https://img.magnific.com/free-vector/abstract-grunge-style-coming-soon-with-black-splatter_1017-26690.jpg?semt=ais_test_b&w=740&q=80',
              width: 240,
              height: 240,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.broken_image,
                  size: 96,
                  color: Colors.grey,
                );
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Coming Soon',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Check back later for new features.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            ElevatedButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                backgroundColor: WidgetStateProperty.all(Colors.blue),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

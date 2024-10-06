import 'package:flutter/material.dart';

class ExoplanetDetail extends StatelessWidget {
  final String title;
  final String description;

  const ExoplanetDetail({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}

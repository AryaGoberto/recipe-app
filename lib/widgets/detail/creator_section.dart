import 'package:flutter/material.dart';

class CreatorSection extends StatelessWidget {
  const CreatorSection({super.key, required this.recipe});

  final Map<String, dynamic> recipe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Creator',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=200&q=80',
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe['creatorName'] ?? 'Natalia Luca',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                Text(
                  recipe['creatorTitle'] ??
                      'I am the author and recipe developer.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF7C8BA1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

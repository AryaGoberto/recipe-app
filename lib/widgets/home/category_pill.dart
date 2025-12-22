import 'package:flutter/material.dart';

class CategoryPill extends StatelessWidget {
  const CategoryPill({
    super.key,
    required this.label,
    required this.isSelected,
  });

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1FB8AD) : const Color(0xFFE8F0F8),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: isSelected ? Colors.white : const Color(0xFF566074),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
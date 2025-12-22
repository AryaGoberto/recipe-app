import 'package:flutter/material.dart';

class SegmentedTabs extends StatelessWidget {
  const SegmentedTabs({
    super.key,
    required this.isIngredientsSelected,
    required this.onTabChanged,
  });

  final bool isIngredientsSelected;
  final ValueChanged<bool> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EEF6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _TabItem(
            label: 'Ingredients',
            isActive: isIngredientsSelected,
            onTap: () => onTabChanged(true),
          ),
          _TabItem(
            label: 'Instructions',
            isActive: !isIngredientsSelected,
            onTap: () => onTabChanged(false),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatefulWidget {
  const _TabItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<_TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<_TabItem> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: widget.onTap,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 120),
          scale: _pressed ? 0.97 : 1.0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: widget.isActive ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              boxShadow: widget.isActive
                  ? [
                      BoxShadow(
                        color: const Color(0xFF1B2A4E).withOpacity(0.10),
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: Text(
                widget.label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: widget.isActive
                      ? const Color(0xFF0F172A)
                      : const Color(0xFF7C8BA1),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'circle_icon_button.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key, required this.recipe});

  final Map<String, dynamic> recipe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          height: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF1B2A4E).withOpacity(0.10),
                blurRadius: 16,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: recipe['image']?.startsWith('http') ?? false
                ? Image.network(
                    recipe['image']!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    recipe['image'] ?? 'assets/images/healthytacos.jpg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
          top: 28,
          left: 28,
          child: CircleIconButton(
            icon: Icons.arrow_back,
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
        Positioned(
          top: 28,
          right: 28,
          child: CircleIconButton(icon: Icons.favorite_border, onTap: () {}),
        ),
      ],
    );
  }
}

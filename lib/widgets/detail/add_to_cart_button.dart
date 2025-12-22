import 'package:flutter/material.dart';
import '../../services/favorite_manager.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({super.key, required this.recipe});

  final Map<String, dynamic> recipe;

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  final FavoriteManager _favoriteManager = FavoriteManager();

  @override
  void initState() {
    super.initState();
    _favoriteManager.addListener(_onFavoritesChanged);
  }

  @override
  void dispose() {
    _favoriteManager.removeListener(_onFavoritesChanged);
    super.dispose();
  }

  void _onFavoritesChanged() {
    setState(() {});
  }

  void _toggleFavorite() {
    _favoriteManager.toggleFavorite(widget.recipe);

    final isFav = _favoriteManager.isFavorite(widget.recipe['title'] ?? '');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFav ? 'Added to favorites!' : 'Removed from favorites',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: isFav ? const Color(0xFF1FB8AD) : const Color(0xFF7C8BA1),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = _favoriteManager.isFavorite(widget.recipe['title'] ?? '');

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isFavorite ? const Color(0xFFFF6B6B) : const Color(0xFF1FB8AD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
          elevation: 0,
        ),
        onPressed: _toggleFavorite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              isFavorite ? 'Remove from Favorite' : 'Add to Favorite',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

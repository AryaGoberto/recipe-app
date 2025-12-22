import 'package:flutter/material.dart';
import '../data/recipe_data.dart';
import 'detail_page.dart';
import '../widgets/home/icon_badge.dart';
import '../widgets/home/category_pill.dart';
import '../widgets/home/featured_card.dart';
import '../widgets/home/popular_card.dart';

class RecipeHomePage extends StatelessWidget {
  const RecipeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(theme),
              const SizedBox(height: 22),
              Text(
                'Featured',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 190,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => FeaturedCard(
                    recipe: RecipeData.featuredRecipes[index],
                    onTap: () => _openDetail(context, RecipeData.featuredRecipes[index]),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                  itemCount: RecipeData.featuredRecipes.length,
                ),
              ),
              const SizedBox(height: 24),
              _buildSectionHeader(theme, 'Category'),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: RecipeData.categories
                    .map(
                      (c) => CategoryPill(
                        label: c,
                        isSelected: c == 'Breakfast',
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 28),
              _buildSectionHeader(theme, 'Popular Recipes'),
              const SizedBox(height: 14),
              SizedBox(
                height: 260,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => PopularCard(
                    recipe: RecipeData.popularRecipes[index],
                    onTap: () => _openDetail(context, RecipeData.popularRecipes[index]),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemCount: RecipeData.popularRecipes.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openDetail(BuildContext context, Map<String, String> recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecipeDetailPage(
          recipe: {
            'title': recipe['title'] ?? 'Healthy Taco Salad',
            'subtitle':
                'This salad is the universal delight of taco night with fresh veggies.',
            'time': recipe['time'] ?? '20 Min',
            'image':
                recipe['image'] ??
                'https://images.unsplash.com/photo-1612874472278-5bcd4b0a9fc7?auto=format&fit=crop&w=1000&q=80',
            'calories': recipe['calories'] ?? '120 Kcal',
            'carbs': '65g carbs',
            'proteins': '27g proteins',
            'fats': '9g fats',
            'ingredients': [
              {'name': 'Tortilla Chips', 'qty': '2'},
              {'name': 'Avocado', 'qty': '1'},
              {'name': 'Red Cabbage', 'qty': '3'},
              {'name': 'Peanuts', 'qty': '1'},
              {'name': 'Red Onions', 'qty': '1'},
            ],
            'creatorName': 'Natalia Luca',
            'creatorTitle': 'I am the author and recipe developer.',
            'related': RecipeData.popularRecipes,
          },
        ),
      ),
    );
  }

  Widget _buildTopBar(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.wb_twilight,
                  size: 18,
                  color: Color(0xFF1FB8AD),
                ),
                const SizedBox(width: 8),
                Text(
                  'Good Morning',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF7C8BA1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Alena Sabyan',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: const Color(0xFF0F172A),
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconBadge(icon: Icons.notifications_none_rounded),
            const SizedBox(width: 10),
            IconBadge(icon: Icons.shopping_bag_outlined),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionHeader(ThemeData theme, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        Text(
          'See All',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF1FB8AD),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
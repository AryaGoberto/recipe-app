import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/favorite_page.dart';
import 'package:food_recipe_app/pages/notification_page.dart';
import '../data/recipe_data.dart';
import 'detail_page.dart';
import '../widgets/home/icon_badge.dart';
import '../widgets/home/featured_card.dart';
import '../widgets/home/popular_card.dart';

class RecipeHomePage extends StatelessWidget {
  const RecipeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;
    final isDesktop = screenWidth >= 1200;

    final horizontalPadding = isMobile ? 20.0 : (isTablet ? 30.0 : 40.0);
    final verticalPadding = isMobile ? 16.0 : 24.0;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(context, theme, isMobile),
              SizedBox(height: isMobile ? 22 : 32),
              Text(
                'Featured',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                  fontSize: isMobile ? null : 24,
                ),
              ),
              SizedBox(height: isMobile ? 14 : 20),
              _buildFeaturedSection(
                context,
                isMobile,
                isTablet,
                isDesktop,
                theme,
              ),
              SizedBox(height: isMobile ? 28 : 48),
              Text(
                'Popular Recipes',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                  fontSize: isMobile ? null : 22,
                ),
              ),
              SizedBox(height: isMobile ? 14 : 20),
              _buildPopularSection(
                context,
                isMobile,
                isTablet,
                isDesktop,
                theme,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    bool isDesktop,
    ThemeData theme,
  ) {
    final cardHeight = isMobile ? 190.0 : 220.0;

    if (isDesktop) {
      return SizedBox(
        height: cardHeight,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              RecipeData.featuredRecipes.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  width: 280,
                  height: cardHeight,
                  child: FeaturedCard(
                    recipe: RecipeData.featuredRecipes[index],
                    onTap: () =>
                        _openDetail(context, RecipeData.featuredRecipes[index]),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: cardHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => FeaturedCard(
          recipe: RecipeData.featuredRecipes[index],
          onTap: () => _openDetail(context, RecipeData.featuredRecipes[index]),
        ),
        separatorBuilder: (_, __) => SizedBox(width: isMobile ? 14 : 20),
        itemCount: RecipeData.featuredRecipes.length,
      ),
    );
  }

  Widget _buildPopularSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    bool isDesktop,
    ThemeData theme,
  ) {
    final crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);
    final childAspectRatio = isMobile ? 0.75 : 0.8;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: isMobile ? 14 : 20,
        mainAxisSpacing: isMobile ? 14 : 20,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: RecipeData.popularRecipes.length,
      itemBuilder: (context, index) => PopularCard(
        recipe: RecipeData.popularRecipes[index],
        onTap: () => _openDetail(context, RecipeData.popularRecipes[index]),
      ),
    );
  }

  void _openDetail(BuildContext context, Map<String, dynamic> recipe) {
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

  void _navigateToFavorites(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FavoritePage()),
    );
  }
  void _navigateToNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const NotificationPage()),
    );
  }

  Widget _buildTopBar(BuildContext context, ThemeData theme, bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
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
                      fontSize: isMobile ? null : 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                'Arya Gunavaro',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                  fontSize: isMobile ? null : 28,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconBadge(
              icon: Icons.favorite_rounded,
              onTap: () => _navigateToFavorites(context),
            ),
            const SizedBox(width: 10),
            IconBadge(icon: Icons.notifications, onTap: ()=>_navigateToNotifications(context),),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }

 
}

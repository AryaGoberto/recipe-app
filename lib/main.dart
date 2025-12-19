import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detail_page.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.poppinsTextTheme();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Recipe',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F8FB),
        textTheme: textTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6F8FB),
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF0F172A)),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1FB8AD),
          primary: const Color(0xFF1FB8AD),
          secondary: const Color(0xFFE8F6F5),
          background: const Color(0xFFF6F8FB),
        ),
      ),
      home: const RecipeHomePage(),
    );
  }
}

class RecipeHomePage extends StatelessWidget {
  const RecipeHomePage({super.key});

  static final List<Map<String, String>> featuredRecipes = [
    {
      'title': 'Asian white noodle with extra seafood',
      'author': 'James Spader',
      'time': '20 Min',
      'image':
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1200&q=80',
    },
    {
      'title': 'Healthy green bowl with fresh veggies',
      'author': 'Olivia Marks',
      'time': '15 Min',
      'image':
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?auto=format&fit=crop&w=1200&q=80',
    },
  ];

  static final List<String> categories = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Vegan',
  ];

  static final List<Map<String, String>> popularRecipes = [
    {
      'title': 'Healthy Taco Salad with fresh vegetable',
      'time': '20 Min',
      'calories': '120 Kcal',
      'image':
          'https://images.unsplash.com/photo-1612874472278-5bcd4b0a9fc7?auto=format&fit=crop&w=1000&q=80',
    },
    {
      'title': 'Japanese-style Pancakes Recipe',
      'time': '16 Min',
      'calories': '128 Kcal',
      'image':
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1000&q=80',
    },
    {
      'title': 'Creamy salmon poke bowl',
      'time': '25 Min',
      'calories': '215 Kcal',
      'image':
          'https://images.unsplash.com/photo-1559050019-6b509a68e480?auto=format&fit=crop&w=1000&q=80',
    },
  ];

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
                  itemBuilder: (context, index) => _FeaturedCard(
                    recipe: featuredRecipes[index],
                    onTap: () => _openDetail(context, featuredRecipes[index]),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                  itemCount: featuredRecipes.length,
                ),
              ),
              const SizedBox(height: 24),
              _buildSectionHeader(theme, 'Category'),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: categories
                    .map(
                      (c) => _CategoryPill(
                        label: c,
                        isSelected: c == 'Breakfast',
                        theme: theme,
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
                  itemBuilder: (context, index) => _PopularCard(
                    recipe: popularRecipes[index],
                    onTap: () => _openDetail(context, popularRecipes[index]),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemCount: popularRecipes.length,
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
            'related': popularRecipes,
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
            _IconBadge(icon: Icons.notifications_none_rounded),
            const SizedBox(width: 10),
            _IconBadge(icon: Icons.shopping_bag_outlined),
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

class _IconBadge extends StatelessWidget {
  const _IconBadge({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1B2A4E).withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Icon(icon, color: const Color(0xFF0F172A), size: 20),
    );
  }
}

class _CategoryPill extends StatelessWidget {
  const _CategoryPill({
    required this.label,
    required this.isSelected,
    required this.theme,
  });

  final String label;
  final bool isSelected;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
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

class _FeaturedCard extends StatelessWidget {
  const _FeaturedCard({required this.recipe, required this.onTap});

  final Map<String, String> recipe;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: 240,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            colors: [Color(0xFF45C5BB), Color(0xFF22B3A4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      recipe['title'] ?? '',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      recipe['image'] ?? '',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=200&q=80',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      recipe['author'] ?? '',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      recipe['time'] ?? '',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PopularCard extends StatelessWidget {
  const _PopularCard({required this.recipe, required this.onTap});

  final Map<String, String> recipe;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1B2A4E).withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  child: Image.network(
                    recipe['image'] ?? '',
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Color(0xFF0F172A),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe['title'] ?? '',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(
                        Icons.local_fire_department,
                        color: Color(0xFF1FB8AD),
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        recipe['calories'] ?? '',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF7C8BA1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.access_time,
                        color: Color(0xFF1FB8AD),
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        recipe['time'] ?? '',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF7C8BA1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
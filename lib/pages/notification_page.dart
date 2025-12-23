import 'package:flutter/material.dart';
import '../data/recipe_data.dart';
import '../widgets/home/popular_card.dart';
import 'detail_page.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // For now, using empty list. Later can connect to real notification service
    final List<Map<String, dynamic>> notifications = [];
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    final horizontalPadding = isMobile ? 20.0 : (isTablet ? 30.0 : 40.0);
    final verticalPadding = isMobile ? 16.0 : 24.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F8FB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0F172A)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: notifications.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications_none,
                      size: 80,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No Notifications',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: const Color(0xFF7C8BA1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'You\'ll see recipe updates here',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF7C8BA1),
                      ),
                    ),
                  ],
                ),
              )
            : _buildNotificationList(
                context,
                notifications,
                theme,
                horizontalPadding,
                verticalPadding,
                isMobile,
                isTablet,
              ),
      ),
    );
  }

  Widget _buildNotificationList(
    BuildContext context,
    List<Map<String, dynamic>> notifications,
    ThemeData theme,
    double horizontalPadding,
    double verticalPadding,
    bool isMobile,
    bool isTablet,
  ) {
    final crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);
    final childAspectRatio = isMobile ? 0.75 : 0.8;
    final spacing = isMobile ? 14.0 : 20.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final recipe = notifications[index];
          return PopularCard(
            recipe: recipe,
            onTap: () => _openDetail(context, recipe),
          );
        },
      ),
    );
  }

  void _openDetail(BuildContext context, Map<String, dynamic> recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecipeDetailPage(
          recipe: {...recipe, 'related': RecipeData.popularRecipes},
        ),
      ),
    );
  }
}

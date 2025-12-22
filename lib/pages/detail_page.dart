import 'package:flutter/material.dart';
import '../widgets/detail/header_image.dart';
import '../widgets/detail/info_chip.dart';
import '../widgets/detail/segmented_tabs.dart';
import '../widgets/detail/ingredient_tile.dart';
import '../widgets/detail/instruction_tile.dart';
import '../widgets/detail/add_to_cart_button.dart';
import '../widgets/detail/creator_section.dart';
import '../widgets/detail/related_section.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({super.key, required this.recipe});

  final Map<String, dynamic> recipe;

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  bool showIngredients = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Map<String, String>> ingredients =
        (widget.recipe['ingredients'] as List<dynamic>? ?? [])
            .cast<Map<String, String>>();
    final List<String> instructions =
        (widget.recipe['instructions'] as List<dynamic>? ??
                [
                  'Prep the veggies and rinse them well.',
                  'Toast tortilla chips lightly for extra crunch.',
                  'Whisk dressing, then toss all ingredients gently.',
                  'Top with peanuts and serve immediately.',
                ])
            .cast<String>();
    final List<Map<String, String>> related =
        (widget.recipe['related'] as List<dynamic>? ?? [])
            .cast<Map<String, String>>();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderImage(recipe: widget.recipe),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
                    Text(
                      widget.recipe['title'] ?? 'Healthy Taco Salad',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.recipe['subtitle'] ??
                                'This salad is the universal delight of taco night. View more',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: const Color(0xFF7C8BA1),
                              height: 1.4,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.schedule,
                              size: 16,
                              color: Color(0xFF7C8BA1),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.recipe['time'] ?? '20 Min',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: const Color(0xFF7C8BA1),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        InfoChip(
                          icon: Icons.local_fire_department,
                          label: widget.recipe['calories'] ?? '120 Kcal',
                        ),
                        InfoChip(
                          icon: Icons.rice_bowl,
                          label: widget.recipe['carbs'] ?? '65g carbs',
                        ),
                        InfoChip(
                          icon: Icons.egg_alt,
                          label: widget.recipe['proteins'] ?? '27g proteins',
                        ),
                        InfoChip(
                          icon: Icons.oil_barrel_outlined,
                          label: widget.recipe['fats'] ?? '9g fats',
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    SegmentedTabs(
                      isIngredientsSelected: showIngredients,
                      onTabChanged: (isIngredients) {
                        setState(() => showIngredients = isIngredients);
                      },
                    ),
                    const SizedBox(height: 16),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 260),
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeIn,
                      transitionBuilder: (child, animation) {
                        final isIngredientsChild =
                            child.key == const ValueKey('ingredients');
                        final offsetTween = Tween<Offset>(
                          begin: Offset(isIngredientsChild ? -0.08 : 0.08, 0),
                          end: Offset.zero,
                        );
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: offsetTween.animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: showIngredients
                          ? Column(
                              key: const ValueKey('ingredients'),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Ingredients',
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFF0F172A),
                                          ),
                                    ),
                                    Text(
                                      'Add All to Cart',
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: const Color(0xFF1FB8AD),
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      IngredientTile(
                                        name: ingredients[index]['name'] ?? '',
                                        qty: ingredients[index]['qty'] ?? '1',
                                      ),
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 10),
                                  itemCount: ingredients.length,
                                ),
                              ],
                            )
                          : Column(
                              key: const ValueKey('instructions'),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Instructions',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF0F172A),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      InstructionTile(
                                        step: index + 1,
                                        text: instructions[index],
                                      ),
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 10),
                                  itemCount: instructions.length,
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(height: 18),
                    const AddToCartButton(),
                    const SizedBox(height: 16),
                    CreatorSection(recipe: widget.recipe),
                    const SizedBox(height: 20),
                    RelatedSection(related: related),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

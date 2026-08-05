import 'package:flutter/material.dart';

import 'package:i_gaming_test_app/features/paywall/domain/subscription_plan.dart';
import 'package:i_gaming_test_app/uikit/uikit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.activePlan,
    this.onReset,
  });

  final SubscriptionPlan? activePlan;
  final VoidCallback? onReset;

  static const _items = [
    (Icons.stadium_rounded, 'Live-матчи сегодня', '12 событий в расписании'),
    (Icons.analytics_rounded, 'Топ-прогнозы', 'Короткие обзоры от аналитиков'),
    (Icons.emoji_events_rounded, 'Турнирная таблица', 'Актуальные позиции команд'),
    (Icons.newspaper_rounded, 'Новости лиги', 'Свежие материалы за сутки'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final planLabel = activePlan?.title ?? 'Активна';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
        actions: [
          if (onReset != null)
            IconButton(
              tooltip: 'Сбросить подписку',
              onPressed: onReset,
              icon: const Icon(Icons.refresh_rounded),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg + 4,
          AppSpacing.sm,
          AppSpacing.lg + 4,
          AppSpacing.xl,
        ),
        children: [
          AppPanel(
            variant: AppPanelVariant.gradient,
            padding: const EdgeInsets.all(AppSpacing.lg + 4),
            borderRadius: BorderRadius.circular(AppRadii.xxl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Добро пожаловать',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: AppColors.textOnPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm - 2),
                Text(
                  'Подписка: $planLabel',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textOnPrimary.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg + 4),
          Text(
            'Контент',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          ..._items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm + 2),
              child: AppPanel(
                variant: AppPanelVariant.plain,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.sm,
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primaryLight,
                    child: Icon(item.$1, color: AppColors.primaryDark),
                  ),
                  title: Text(
                    item.$2,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  subtitle: Text(
                    item.$3,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:i_gaming_test_app/features/paywall/domain/subscription_plan.dart';

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
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.tertiary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Добро пожаловать',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Подписка: $planLabel',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Контент',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          ..._items.map(
            (item) => Card(
              elevation: 0,
              color: theme.colorScheme.surfaceContainerLowest,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: theme.colorScheme.outlineVariant),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                leading: CircleAvatar(
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Icon(
                    item.$1,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                title: Text(
                  item.$2,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(item.$3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:i_gaming_test_app/features/paywall/domain/subscription_plan.dart';
import 'package:i_gaming_test_app/features/paywall/presentation/widgets/plan_card.dart';
import 'package:i_gaming_test_app/uikit/uikit.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({
    super.key,
    required this.selectedPlan,
    required this.isPurchasing,
    required this.onSelectPlan,
    required this.onContinue,
  });

  final SubscriptionPlan selectedPlan;
  final bool isPurchasing;
  final ValueChanged<SubscriptionPlan> onSelectPlan;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.xl,
            AppSpacing.lg,
            AppSpacing.xl,
            AppSpacing.xl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Разблокируй полный доступ',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.sm + 2),
              Text(
                'Выбери подписку',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: AppSpacing.xxl + 4),
              ...SubscriptionPlan.values.map(
                (plan) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: PlanCard(
                    plan: plan,
                    selected: selectedPlan == plan,
                    onTap: () => onSelectPlan(plan),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'Отмена в любой момент.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton.primary(
                label: 'Продолжить',
                isLoading: isPurchasing,
                onPressed: onContinue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

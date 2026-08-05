import 'package:flutter/material.dart';
import 'package:i_gaming_test_app/features/paywall/domain/subscription_plan.dart';
import 'package:i_gaming_test_app/features/paywall/presentation/widgets/plan_card.dart';
import 'package:i_gaming_test_app/uikit/primary_button.dart';

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
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                'Разблокируй полный доступ',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Выбери подписку',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 36),
              ...SubscriptionPlan.values.map(
                (plan) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
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
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
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

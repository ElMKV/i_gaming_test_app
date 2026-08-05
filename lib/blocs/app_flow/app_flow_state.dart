import 'package:equatable/equatable.dart';

import 'package:i_gaming_test_app/features/paywall/domain/subscription_plan.dart';

enum AppStep { loading, onboarding, paywall, home }

final class AppFlowState extends Equatable {
  const AppFlowState({
    required this.step,
    this.selectedPlan = SubscriptionPlan.yearly,
    this.activePlan,
    this.isPurchasing = false,
  });

  final AppStep step;
  final SubscriptionPlan selectedPlan;
  final SubscriptionPlan? activePlan;
  final bool isPurchasing;

  AppFlowState copyWith({
    AppStep? step,
    SubscriptionPlan? selectedPlan,
    SubscriptionPlan? activePlan,
    bool? isPurchasing,
  }) {
    return AppFlowState(
      step: step ?? this.step,
      selectedPlan: selectedPlan ?? this.selectedPlan,
      activePlan: activePlan ?? this.activePlan,
      isPurchasing: isPurchasing ?? this.isPurchasing,
    );
  }

  @override
  List<Object?> get props => [step, selectedPlan, activePlan, isPurchasing];
}

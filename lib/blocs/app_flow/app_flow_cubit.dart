import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:i_gaming_test_app/blocs/app_flow/app_flow_state.dart';
import 'package:i_gaming_test_app/core/storage/subscription_storage.dart';
import 'package:i_gaming_test_app/features/paywall/domain/subscription_plan.dart';

class AppFlowCubit extends Cubit<AppFlowState> {
  AppFlowCubit(this._storage)
      : super(const AppFlowState(step: AppStep.loading));

  final SubscriptionStorage _storage;

  Future<void> bootstrap() async {
    final subscribed = await _storage.isSubscribed();
    if (subscribed) {
      final plan = await _storage.getPlan();
      emit(
        state.copyWith(
          step: AppStep.home,
          activePlan: plan,
        ),
      );
      return;
    }

    emit(state.copyWith(step: AppStep.onboarding));
  }

  void completeOnboarding() {
    emit(state.copyWith(step: AppStep.paywall));
  }

  void selectPlan(SubscriptionPlan plan) {
    emit(state.copyWith(selectedPlan: plan));
  }

  Future<void> purchaseSelectedPlan() async {
    if (state.isPurchasing) return;

    emit(state.copyWith(isPurchasing: true));

    // Emulated billing delay — no real IAP.
    await Future<void>.delayed(const Duration(milliseconds: 600));
    await _storage.saveSubscription(state.selectedPlan);

    emit(
      state.copyWith(
        step: AppStep.home,
        activePlan: state.selectedPlan,
        isPurchasing: false,
      ),
    );
  }

  /// Dev helper: reset purchase and restart flow from onboarding.
  Future<void> resetSubscription() async {
    await _storage.clear();
    emit(
      const AppFlowState(
        step: AppStep.onboarding,
        selectedPlan: SubscriptionPlan.yearly,
      ),
    );
  }
}

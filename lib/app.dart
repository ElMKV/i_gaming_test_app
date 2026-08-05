import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:i_gaming_test_app/blocs/app_flow/app_flow_cubit.dart';
import 'package:i_gaming_test_app/blocs/app_flow/app_flow_state.dart';
import 'package:i_gaming_test_app/config/themes/app_theme.dart';
import 'package:i_gaming_test_app/features/home/presentation/home_screen.dart';
import 'package:i_gaming_test_app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:i_gaming_test_app/features/paywall/presentation/paywall_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iGaming Test App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: BlocBuilder<AppFlowCubit, AppFlowState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: switch (state.step) {
              AppStep.loading => const Scaffold(
                  key: ValueKey('loading'),
                  body: Center(child: CircularProgressIndicator()),
                ),
              AppStep.onboarding => OnboardingScreen(
                  key: const ValueKey('onboarding'),
                  onContinue: context.read<AppFlowCubit>().completeOnboarding,
                ),
              AppStep.paywall => PaywallScreen(
                  key: const ValueKey('paywall'),
                  selectedPlan: state.selectedPlan,
                  isPurchasing: state.isPurchasing,
                  onSelectPlan: context.read<AppFlowCubit>().selectPlan,
                  onContinue:
                      context.read<AppFlowCubit>().purchaseSelectedPlan,
                ),
              AppStep.home => HomeScreen(
                  key: const ValueKey('home'),
                  activePlan: state.activePlan,
                  onReset: context.read<AppFlowCubit>().resetSubscription,
                ),
            },
          );
        },
      ),
    );
  }
}

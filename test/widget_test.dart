import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:i_gaming_test_app/app.dart';
import 'package:i_gaming_test_app/blocs/app_flow/app_flow_cubit.dart';
import 'package:i_gaming_test_app/core/storage/subscription_storage.dart';
import 'package:i_gaming_test_app/features/paywall/domain/subscription_plan.dart';

class _FakeStorage implements SubscriptionStorage {
  bool subscribed = false;
  SubscriptionPlan? plan;

  @override
  Future<void> clear() async {
    subscribed = false;
    plan = null;
  }

  @override
  Future<SubscriptionPlan?> getPlan() async => plan;

  @override
  Future<bool> isSubscribed() async => subscribed;

  @override
  Future<void> saveSubscription(SubscriptionPlan value) async {
    subscribed = true;
    plan = value;
  }
}

void main() {
  testWidgets('shows onboarding when not subscribed', (tester) async {
    final storage = _FakeStorage();
    final cubit = AppFlowCubit(storage);
    await cubit.bootstrap();

    await tester.pumpWidget(
      BlocProvider.value(
        value: cubit,
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Играй умнее'), findsOneWidget);
    expect(find.text('Продолжить'), findsOneWidget);
  });

  testWidgets('opens home when already subscribed', (tester) async {
    final storage = _FakeStorage()
      ..subscribed = true
      ..plan = SubscriptionPlan.yearly;
    final cubit = AppFlowCubit(storage);
    await cubit.bootstrap();

    await tester.pumpWidget(
      BlocProvider.value(
        value: cubit,
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Главная'), findsOneWidget);
    expect(find.textContaining('Подписка: Год'), findsOneWidget);
  });
}

import 'package:shared_preferences/shared_preferences.dart';

import 'package:i_gaming_test_app/features/paywall/domain/subscription_plan.dart';

abstract class SubscriptionStorage {
  Future<bool> isSubscribed();

  Future<SubscriptionPlan?> getPlan();

  Future<void> saveSubscription(SubscriptionPlan plan);

  Future<void> clear();
}

class SharedPreferencesSubscriptionStorage implements SubscriptionStorage {
  SharedPreferencesSubscriptionStorage(this._prefs);

  static const _subscribedKey = 'is_subscribed';
  static const _planKey = 'subscription_plan';

  final SharedPreferences _prefs;

  @override
  Future<bool> isSubscribed() async {
    return _prefs.getBool(_subscribedKey) ?? false;
  }

  @override
  Future<SubscriptionPlan?> getPlan() async {
    final raw = _prefs.getString(_planKey);
    if (raw == null) return null;
    return SubscriptionPlan.values.byName(raw);
  }

  @override
  Future<void> saveSubscription(SubscriptionPlan plan) async {
    await _prefs.setBool(_subscribedKey, true);
    await _prefs.setString(_planKey, plan.name);
  }

  @override
  Future<void> clear() async {
    await _prefs.remove(_subscribedKey);
    await _prefs.remove(_planKey);
  }
}

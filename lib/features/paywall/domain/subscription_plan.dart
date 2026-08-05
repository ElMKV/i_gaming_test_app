enum SubscriptionPlan {
  monthly,
  yearly;

  String get title => switch (this) {
        SubscriptionPlan.monthly => 'Месяц',
        SubscriptionPlan.yearly => 'Год',
      };

  String get priceLabel => switch (this) {
        SubscriptionPlan.monthly => '\$9.99 / мес',
        SubscriptionPlan.yearly => '\$59.99 / год',
      };

  String? get badge => switch (this) {
        SubscriptionPlan.monthly => null,
        SubscriptionPlan.yearly => '−50%',
      };
}

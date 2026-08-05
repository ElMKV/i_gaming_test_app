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

  List<String> get benefits => switch (this) {
        SubscriptionPlan.monthly => const [
            'Доступ ко всем live-матчам',
            'Базовая аналитика и прогнозы',
            'Отмена в любой момент',
          ],
        SubscriptionPlan.yearly => const [
            'Всё из месячного тарифа',
            'Расширенная аналитика и тренды',
            'Приоритетные уведомления',
            '2 месяца в подарок',
          ],
      };
}

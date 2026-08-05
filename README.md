# iGaming Test App

Тестовое Flutter-приложение: онбординг → paywall → главный экран, с сохранением статуса подписки.

## Архитектура

Однонаправленный поток через **Cubit** (`AppFlowCubit`):

1. При старте читаем `SharedPreferences`.
2. Если подписка есть → сразу **Home**.
3. Иначе: **Onboarding** → **Paywall** → эмуляция покупки → **Home**.

Слои:

| Слой | Назначение |
|------|------------|
| `features/` | UI экранов (onboarding, paywall, home) |
| `blocs/` | Состояние флоу приложения |
| `core/storage/` | Абстракция + реализация хранения подписки |
| `config/themes/` | Тема |
| `uikit/` | Переиспользуемые виджеты |

Покупка **эмулируется** (задержка + запись в storage). Реальный IAP не подключён.

## Структура проекта

```
lib/
  main.dart                 # bootstrap + DI
  app.dart                  # MaterialApp + маршрутизация по AppStep
  blocs/app_flow/           # Cubit / State
  core/storage/             # SubscriptionStorage (SharedPreferences)
  features/
    onboarding/presentation/
    paywall/
      domain/               # SubscriptionPlan
      presentation/
    home/presentation/
  config/themes/
  uikit/
    colors/                 # AppColors
    tokens/                 # spacing / radii
    buttons/                # AppButton
    panels/                 # AppPanel
    badges/                 # AppBadge
```

## Запуск

```bash
flutter pub get
flutter run
```

На главном экране кнопка ↻ сбрасывает подписку (удобно для повторной проверки флоу).

## Что бы улучшил при большем времени

- Настоящий In-App Purchase (StoreKit / Play Billing) вместо эмуляции
- Отдельные Cubit для paywall и более строгая навигация (go_router / auto_route)
- Локализация, тёмная тема, анимации онбординга
- Unit/widget-тесты на `AppFlowCubit` и storage
- Аналитика событий воронки (onboarding → paywall → purchase)

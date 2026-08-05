# iGaming Test App

Тестовое Flutter-приложение: онбординг → paywall → главный экран, с сохранением статуса подписки.

## Архитектура

Однонаправленный флоу через **Cubit** (`AppFlowCubit`):

1. При старте читаем `SharedPreferences`
2. Если подписка есть → сразу **Home**
3. Иначе: **Onboarding** → **Paywall** → эмуляция покупки → **Home**

Слои:

| Слой | Назначение |
|------|------------|
| `features/` | UI экранов (onboarding, paywall, home) |
| `blocs/` | Состояние флоу приложения |
| `core/storage/` | Абстракция + реализация хранения подписки |
| `uikit/` | Цвета, кнопки, панели, бейджи, токены |
| `config/themes/` | Тема Material на базе UI Kit |

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
      domain/               # SubscriptionPlan + benefits
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
- Отдельные Cubit под экраны + навигация через `go_router` / `auto_route`
- Локализация, тёмная тема, более богатые анимации онбординга
- Unit/widget-тесты на `AppFlowCubit` и storage
- Аналитика воронки (onboarding → paywall → purchase)

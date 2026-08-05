import 'package:flutter/material.dart';

import 'package:i_gaming_test_app/uikit/colors/app_colors.dart';
import 'package:i_gaming_test_app/uikit/tokens/app_tokens.dart';

enum AppPanelVariant { plain, selected, muted, gradient }

class AppPanel extends StatelessWidget {
  const AppPanel({
    super.key,
    required this.child,
    this.variant = AppPanelVariant.plain,
    this.padding,
    this.margin,
    this.onTap,
    this.borderRadius,
  });

  final Widget child;
  final AppPanelVariant variant;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(AppRadii.xl);
    final decoration = switch (variant) {
      AppPanelVariant.plain => BoxDecoration(
          color: AppColors.panel,
          borderRadius: radius,
          border: Border.all(color: AppColors.border),
        ),
      AppPanelVariant.selected => BoxDecoration(
          color: AppColors.panelSelected,
          borderRadius: radius,
          border: Border.all(color: AppColors.borderFocused, width: 2),
        ),
      AppPanelVariant.muted => BoxDecoration(
          color: AppColors.panelMuted,
          borderRadius: radius,
          border: Border.all(color: AppColors.border),
        ),
      AppPanelVariant.gradient => BoxDecoration(
          borderRadius: radius,
          gradient: const LinearGradient(
            colors: [AppColors.gradientStart, AppColors.gradientEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
    };

    final content = Container(
      width: double.infinity,
      margin: margin,
      padding: padding ?? const EdgeInsets.all(AppSpacing.lg),
      decoration: decoration,
      child: child,
    );

    if (onTap == null) return content;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: content,
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide ButtonStyleButton, TextButton;
import '../m3/text_button.dart' as m3;
import '../button_style_button.dart';

class TextButton extends m3.TextButton {
  const TextButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    required super.child,
  });

  TextButton.icon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    Widget? icon,
    required Widget label,
    IconAlignment? iconAlignment,
  }) : super.icon(
          icon: icon,
          label: label,
          iconAlignment: iconAlignment,
        );
  
  TextButton.iconM3E({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    Widget? icon,
    required Widget label,
    IconAlignment? iconAlignment,
  }) : super.icon(
          icon: icon,
          label: label,
          iconAlignment: iconAlignment,
        );

  @override
  ButtonStyle themeDefaults(BuildContext context) =>
      _TextButtonDefaultsM3E(context);



}

class _TextButtonDefaultsM3E extends ButtonStyle {
  _TextButtonDefaultsM3E(this.context)
   : super(
       animationDuration: kThemeChangeDuration,
       enableFeedback: true,
       alignment: Alignment.center,
     );

  final BuildContext context;
  late final ColorScheme _colors = Theme.of(context).colorScheme;

  @override
  WidgetStateProperty<TextStyle?> get textStyle =>
      MaterialStatePropertyAll<TextStyle?>(
          Theme.of(context).textTheme.titleLarge);

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
    const MaterialStatePropertyAll<Color>(Colors.transparent);

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
    WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return _colors.onSurface.withOpacity(0.38);
      }
        return _colors.tertiary;
    });

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
    WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return _colors.primary.withOpacity(0.1);
      }
      if (states.contains(WidgetState.hovered)) {
        return _colors.primary.withOpacity(0.08);
      }
      if (states.contains(WidgetState.focused)) {
        return _colors.primary.withOpacity(0.1);
      }
      return null;
    });

  @override
  WidgetStateProperty<Color>? get shadowColor =>
    const MaterialStatePropertyAll<Color>(Colors.transparent);

  @override
  WidgetStateProperty<Color>? get surfaceTintColor =>
    const MaterialStatePropertyAll<Color>(Colors.transparent);

  @override
  WidgetStateProperty<double>? get elevation =>
      const MaterialStatePropertyAll<double>(5.0);

  @override
  WidgetStateProperty<EdgeInsetsGeometry>? get padding =>
      MaterialStatePropertyAll<EdgeInsetsGeometry>(
          ButtonStyleButton.scaledPadding(
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        const EdgeInsets.symmetric(horizontal: 8),
        const EdgeInsets.symmetric(horizontal: 4),
        MediaQuery.textScalerOf(context).scale(
                Theme.of(context).textTheme.labelLarge?.fontSize ?? 14.0) /
            14.0,
      ));

  @override
  WidgetStateProperty<Size>? get minimumSize =>
    const MaterialStatePropertyAll<Size>(Size(64.0, 40.0));

  @override
  WidgetStateProperty<double>? get iconSize =>
    const MaterialStatePropertyAll<double>(18.0);

  @override
  WidgetStateProperty<Color>? get iconColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return _colors.onSurface.withOpacity(0.38);
      }
      if (states.contains(WidgetState.pressed)) {
        return _colors.error;
      }
      if (states.contains(WidgetState.hovered)) {
        return _colors.error;
      }
      if (states.contains(WidgetState.focused)) {
        return _colors.error;
      }
      return _colors.error;
    });
  }

  @override
  WidgetStateProperty<Size>? get maximumSize =>
    const MaterialStatePropertyAll<Size>(Size.infinite);

  @override
  WidgetStateProperty<OutlinedBorder>? get shape =>
    const MaterialStatePropertyAll<OutlinedBorder>(StadiumBorder());

  @override
  WidgetStateProperty<MouseCursor?>? get mouseCursor => WidgetStateMouseCursor.adaptiveClickable;

  @override
  VisualDensity? get visualDensity => Theme.of(context).visualDensity;

  @override
  MaterialTapTargetSize? get tapTargetSize => Theme.of(context).materialTapTargetSize;

  @override
  InteractiveInkFeatureFactory? get splashFactory => Theme.of(context).splashFactory;
}

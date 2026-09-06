import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const brandPrimary = Color(0xffdd4584);

const shadColorSchemeDark = ShadColorScheme(
  background: Color(0xff0b0b0f),
  foreground: Color(0xfff4f4f6),
  card: Color(0xff17171c),
  cardForeground: Color(0xfff4f4f6),
  popover: Color(0xff17171c),
  popoverForeground: Color(0xfff4f4f6),
  primary: brandPrimary,
  primaryForeground: Color(0xfffff1f2),
  secondary: Color(0xff232329),
  secondaryForeground: Color(0xfff4f4f6),
  muted: Color(0xff232329),
  mutedForeground: Color(0xff9f9fae),
  accent: Color(0xff2a2a32),
  accentForeground: Color(0xfff4f4f6),
  destructive: Color(0xffb91c1c),
  destructiveForeground: Color(0xfffef2f2),
  border: Color(0xff2a2a32),
  input: Color(0xff2a2a32),
  ring: brandPrimary,
  selection: Color(0xff5a2340),
);

const shadColorSchemeLight = ShadColorScheme(
  background: Color(0xffffffff),
  foreground: Color(0xff17171c),
  card: Color(0xffffffff),
  cardForeground: Color(0xff17171c),
  popover: Color(0xffffffff),
  popoverForeground: Color(0xff17171c),
  primary: brandPrimary,
  primaryForeground: Color(0xfffff1f2),
  secondary: Color(0xfff4f4f6),
  secondaryForeground: Color(0xff17171c),
  muted: Color(0xfff4f4f6),
  mutedForeground: Color(0xff71717a),
  accent: Color(0xfff4f4f6),
  accentForeground: Color(0xff17171c),
  destructive: Color(0xffdc2626),
  destructiveForeground: Color(0xffffffff),
  border: Color(0xffe4e4e9),
  input: Color(0xffe4e4e9),
  ring: brandPrimary,
  selection: Color(0xfff7c4d8),
);

ShadThemeData shadThemeOfBrightness(Brightness brightness) {
  return ShadThemeData(
    brightness: brightness,
    colorScheme: brightness == Brightness.dark
        ? shadColorSchemeDark
        : shadColorSchemeLight,
  );
}

ColorScheme applyBrandSurfaces(ColorScheme scheme, Brightness brightness) {
  final isDark = brightness == Brightness.dark;
  return scheme.copyWith(
    primary: brandPrimary,
    onPrimary: Colors.white,
    primaryContainer: isDark
        ? const Color(0xff8a2a52)
        : const Color(0xfffbd1e0),
    onPrimaryContainer: isDark
        ? const Color(0xffffd9e3)
        : const Color(0xff5c0f2e),
    surface: isDark ? const Color(0xff0b0b0f) : const Color(0xffffffff),
    onSurface: isDark ? const Color(0xfff4f4f6) : const Color(0xff17171c),
    surfaceContainerLowest: isDark
        ? const Color(0xff0b0b0f)
        : const Color(0xffffffff),
    surfaceContainerLow: isDark
        ? const Color(0xff121216)
        : const Color(0xfff4f4f6),
    surfaceContainer: isDark
        ? const Color(0xff17171c)
        : const Color(0xfff4f4f6),
    surfaceContainerHigh: isDark
        ? const Color(0xff1c1c22)
        : const Color(0xffececf1),
    surfaceContainerHighest: isDark
        ? const Color(0xff232329)
        : const Color(0xffe4e4e9),
    onSurfaceVariant: isDark
        ? const Color(0xff9f9fae)
        : const Color(0xff71717a),
    outline: isDark ? const Color(0xff2a2a32) : const Color(0xffe4e4e9),
    outlineVariant: isDark
        ? const Color(0xff232329)
        : const Color(0xffececf1),
    inverseSurface: isDark
        ? const Color(0xfff4f4f6)
        : const Color(0xff17171c),
    onInverseSurface: isDark
        ? const Color(0xff17171c)
        : const Color(0xfff4f4f6),
    inversePrimary: isDark
        ? const Color(0xff8a2a52)
        : const Color(0xfffbd1e0),
  );
}

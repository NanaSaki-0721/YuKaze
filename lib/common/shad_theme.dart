import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const _pinkPrimary = Color(0xffe11d48);

const shadColorSchemeDark = ShadColorScheme(
  background: Color(0xff0b0b0f),
  foreground: Color(0xfff4f4f6),
  card: Color(0xff17171c),
  cardForeground: Color(0xfff4f4f6),
  popover: Color(0xff17171c),
  popoverForeground: Color(0xfff4f4f6),
  primary: _pinkPrimary,
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
  ring: _pinkPrimary,
  selection: Color(0xff4c1d29),
);

const shadColorSchemeLight = ShadColorScheme(
  background: Color(0xffffffff),
  foreground: Color(0xff17171c),
  card: Color(0xffffffff),
  cardForeground: Color(0xff17171c),
  popover: Color(0xffffffff),
  popoverForeground: Color(0xff17171c),
  primary: _pinkPrimary,
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
  ring: _pinkPrimary,
  selection: Color(0xfffecdd3),
);

ShadThemeData shadThemeOfBrightness(Brightness brightness) {
  return ShadThemeData(
    brightness: brightness,
    colorScheme: brightness == Brightness.dark
        ? shadColorSchemeDark
        : shadColorSchemeLight,
  );
}

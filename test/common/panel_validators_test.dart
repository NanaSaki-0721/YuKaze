import 'package:fl_clash/common/common.dart';
import 'package:test/test.dart';

void main() {
  group('isValidPanelEmail', () {
    test('accepts common email formats', () {
      expect(isValidPanelEmail('user@example.com'), isTrue);
      expect(isValidPanelEmail('a.b+tag@sub.domain.org'), isTrue);
    });

    test('rejects empty and malformed emails', () {
      expect(isValidPanelEmail(''), isFalse);
      expect(isValidPanelEmail(null), isFalse);
      expect(isValidPanelEmail('user'), isFalse);
      expect(isValidPanelEmail('user@domain'), isFalse);
      expect(isValidPanelEmail('user domain@example.com'), isFalse);
      expect(isValidPanelEmail('user@exa mple.com'), isFalse);
    });
  });

  group('validatePanelPassword', () {
    test('requires a password', () {
      expect(validatePanelPassword(null), 'panelPasswordRequired');
      expect(validatePanelPassword(''), 'panelPasswordRequired');
    });

    test('requires at least 8 characters', () {
      expect(validatePanelPassword('1234567'), 'panelPasswordTooShort');
      expect(validatePanelPassword('12345678'), isNull);
    });
  });

  group('validatePanelConfirmPassword', () {
    test('requires confirmation', () {
      expect(validatePanelConfirmPassword('12345678', ''), 'panelConfirmPasswordRequired');
      expect(validatePanelConfirmPassword('12345678', null), 'panelConfirmPasswordRequired');
    });

    test('requires matching passwords', () {
      expect(
        validatePanelConfirmPassword('12345678', '12345679'),
        'panelPasswordsDoNotMatch',
      );
      expect(validatePanelConfirmPassword('12345678', '12345678'), isNull);
    });
  });
}

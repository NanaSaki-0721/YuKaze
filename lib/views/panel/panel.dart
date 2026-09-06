import 'dart:async';

import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/views/panel/services.dart';
import 'package:fl_clash/views/panel/shop.dart';
import 'package:fl_clash/views/tools.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class FadeSlideIn extends StatelessWidget {
  final int index;
  final Widget child;

  const FadeSlideIn({super.key, required this.index, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 420),
      curve: Interval(
        (index * 0.08).clamp(0.0, 0.6),
        1,
        curve: Curves.easeOutCubic,
      ),
      child: child,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 24 * (1 - value)),
            child: child,
          ),
        );
      },
    );
  }
}

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}

class PanelView extends ConsumerWidget {
  const PanelView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(panelSessionProvider);
    return session.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, _) => const LoginView(),
      data: (authData) {
        if (authData == null || authData.isEmpty) {
          return const LoginView();
        }
        return const PanelHomeView();
      },
    );
  }
}

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _codeController = TextEditingController();
  String? _challenge;
  String? _error;
  bool _submitting = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    final appLocalizations = context.appLocalizations;
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _error = appLocalizations.panelInputRequired;
      });
      return;
    }
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      final challenge = _challenge;
      if (challenge == null) {
        final nextChallenge = await ref.read(
          panelActionProvider.notifier,
        ).login(
          email: email,
          password: password,
        );
        if (nextChallenge != null) {
          setState(() {
            _challenge = nextChallenge;
          });
        }
      } else {
        final code = _codeController.text.trim();
        if (code.isEmpty) {
          setState(() {
            _error = appLocalizations.panelInputRequired;
          });
          return;
        }
        await ref
            .read(panelActionProvider.notifier)
            .verify2fa(challenge: challenge, code: code);
      }
    } catch (error) {
      setState(() {
        _error = error.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _submitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.appLocalizations;
    final challenge = _challenge;
    return CommonScaffold(
      title: appLocalizations.panelLogin,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FadeSlideIn(
                  index: 0,
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: appLocalizations.panelEmail,
                    ),
                  ),
                ),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 1,
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: appLocalizations.panelPassword,
              ),
              onSubmitted: (_) => _handleSubmit(),
            ),
          ),
          if (challenge != null) ...[
            const SizedBox(height: 12),
            FadeSlideIn(
              index: 2,
              child: TextField(
                controller: _codeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: appLocalizations.panelTwoFactorCode,
                ),
                onSubmitted: (_) => _handleSubmit(),
              ),
            ),
          ],
          if (_error != null) ...[
            const SizedBox(height: 12),
            Text(
              _error!,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.error,
              ),
            ),
          ],
          const SizedBox(height: 16),
          FadeSlideIn(
            index: 3,
            child: FilledButton(
              onPressed: _submitting ? null : _handleSubmit,
              child: Text(
                challenge == null
                    ? appLocalizations.panelLogin
                    : appLocalizations.confirm,
              ),
            ),
          ),
          FadeSlideIn(
            index: 4,
            child: TextButton(
              onPressed: _submitting
                  ? null
                  : () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const RegisterView(),
                        ),
                      );
                    },
              child: Text(appLocalizations.panelRegister),
            ),
          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailCodeController = TextEditingController();
  final _inviteCodeController = TextEditingController();
  String? _selectedSuffix;
  bool _agreeTerms = false;
  String? _error;
  String? _sentTip;
  bool _submitting = false;
  int _cooldown = 0;
  Timer? _cooldownTimer;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailCodeController.dispose();
    _inviteCodeController.dispose();
    _cooldownTimer?.cancel();
    super.dispose();
  }

  List<String> _whitelistSuffixes(PanelSiteConfig? config) {
    return config?.emailWhitelistSuffix ?? [];
  }

  String get _email {
    final suffixes = _whitelistSuffixes(
      ref.read(siteConfigInfoProvider).value,
    );
    if (suffixes.isNotEmpty) {
      final suffix = _selectedSuffix ?? suffixes.first;
      return '${_emailController.text.trim()}@$suffix';
    }
    return _emailController.text.trim();
  }

  String _resolveError(String key) {
    final appLocalizations = context.appLocalizations;
    return switch (key) {
      'panelEmailRequired' => appLocalizations.panelEmailRequired,
      'panelEmailInvalid' => appLocalizations.panelEmailInvalid,
      'panelPasswordRequired' => appLocalizations.panelPasswordRequired,
      'panelPasswordTooShort' => appLocalizations.panelPasswordTooShort,
      'panelConfirmPasswordRequired' =>
        appLocalizations.panelConfirmPasswordRequired,
      'panelPasswordsDoNotMatch' => appLocalizations.panelPasswordsDoNotMatch,
      'panelCodeRequired' => appLocalizations.panelCodeRequired,
      'panelInviteCodeRequired' => appLocalizations.panelInviteCodeRequired,
      'panelMustAgreeToTerms' => appLocalizations.panelMustAgreeToTerms,
      _ => key,
    };
  }

  Future<void> _handleSendCode() async {
    final appLocalizations = context.appLocalizations;
    final email = _email;
    if (!isValidPanelEmail(email)) {
      setState(() {
        _error = appLocalizations.panelEmailInvalid;
      });
      return;
    }
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      await ref.read(panelActionProvider.notifier).sendEmailVerify(email);
      setState(() {
        _sentTip = appLocalizations.panelEmailCodeSent;
        _cooldown = 60;
      });
      _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!mounted || _cooldown <= 1) {
          timer.cancel();
          if (mounted) {
            setState(() {
              _cooldown = 0;
            });
          }
          return;
        }
        setState(() {
          _cooldown -= 1;
        });
      });
    } catch (error) {
      setState(() {
        _error = error.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _submitting = false;
        });
      }
    }
  }

  Future<void> _handleRegister() async {
    final appLocalizations = context.appLocalizations;
    final config = ref.read(siteConfigInfoProvider).value;
    final email = _email;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    final emailCode = _emailCodeController.text.trim();
    final inviteCode = _inviteCodeController.text.trim();
    String? error;
    if (!isValidPanelEmail(email)) {
      error = appLocalizations.panelEmailInvalid;
    } else if (validatePanelPassword(password) != null) {
      error = _resolveError(validatePanelPassword(password)!);
    } else if (validatePanelConfirmPassword(password, confirmPassword) !=
        null) {
      error = _resolveError(
        validatePanelConfirmPassword(password, confirmPassword)!,
      );
    } else if ((config?.isEmailVerify ?? 0) == 1 && emailCode.isEmpty) {
      error = appLocalizations.panelCodeRequired;
    } else if ((config?.isInviteForce ?? 0) == 1 && inviteCode.isEmpty) {
      error = appLocalizations.panelInviteCodeRequired;
    } else if (!_agreeTerms) {
      error = appLocalizations.panelMustAgreeToTerms;
    }
    if (error != null) {
      setState(() {
        _error = error;
      });
      return;
    }
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      await ref.read(panelActionProvider.notifier).register(
        email: email,
        password: password,
        emailCode: emailCode,
        inviteCode: inviteCode,
      );
      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (error) {
      setState(() {
        _error = error.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _submitting = false;
        });
      }
    }
  }

  Widget _buildEmailField(BuildContext context, PanelSiteConfig? config) {
    final appLocalizations = context.appLocalizations;
    final suffixes = _whitelistSuffixes(config);
    if (suffixes.isEmpty) {
      return TextField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: appLocalizations.panelEmail,
        ),
      );
    }
    final suffix = _selectedSuffix ?? suffixes.first;
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: appLocalizations.panelEmail,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text('@', style: context.textTheme.titleMedium),
        const SizedBox(width: 8),
        ShadSelect<String>(
          initialValue: suffix,
          enabled: !_submitting,
          selectedOptionBuilder: (_, value) => Text(value),
          options: [
            for (final item in suffixes)
              ShadOption(value: item, child: Text(item)),
          ],
          onChanged: (value) {
            if (value == null) return;
            setState(() {
              _selectedSuffix = value;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.appLocalizations;
    final config = ref.watch(siteConfigInfoProvider).value;
    return CommonScaffold(
      title: appLocalizations.panelRegister,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
          FadeSlideIn(index: 0, child: _buildEmailField(context, config)),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 1,
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: appLocalizations.panelPassword,
              ),
            ),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 2,
            child: TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: appLocalizations.panelConfirmPassword,
              ),
            ),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 3,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _emailCodeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: appLocalizations.panelEmailCode,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton.tonal(
                  onPressed: _submitting || _cooldown > 0
                      ? null
                      : _handleSendCode,
                  child: Text(
                    _cooldown > 0
                        ? appLocalizations.secondsCount(_cooldown)
                        : appLocalizations.panelSendCode,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 4,
            child: TextField(
              controller: _inviteCodeController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: appLocalizations.panelInviteCode,
              ),
            ),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 5,
            child: ShadCheckbox(
              value: _agreeTerms,
              label: Text(appLocalizations.panelAgreeTerms),
              onChanged: (value) {
                setState(() {
                  _agreeTerms = value;
                });
              },
            ),
          ),
          if (config?.tosUrl != null) ...[
            ShadButton.ghost(
              onPressed: () {
                launchUrl(Uri.parse(config!.tosUrl!));
              },
              child: Text(appLocalizations.panelTermsOfService),
            ),
            const SizedBox(height: 4),
          ],
          if (_sentTip != null) ...[
            const SizedBox(height: 4),
            Text(_sentTip!, style: context.textTheme.bodyMedium),
          ],
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(
              _error!,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.error,
              ),
            ),
          ],
          const SizedBox(height: 16),
          FadeSlideIn(
            index: 6,
            child: FilledButton(
              onPressed: _submitting ? null : _handleRegister,
              child: Text(appLocalizations.panelRegister),
            ),
          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PanelHomeView extends ConsumerWidget {
  const PanelHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = context.appLocalizations;
    final userInfo = ref.watch(userInfoProvider);
    final subscribeInfo = ref.watch(subscribeInfoProvider);
    return CommonScaffold(
      title: appLocalizations.panel,
      actions: [
        IconButton.filledTonal(
          onPressed: () async {
            await ref.read(panelActionProvider.notifier).ensureSubscription();
            await ref.read(userInfoProvider.notifier).refresh();
            await ref.read(subscribeInfoProvider.notifier).refresh();
          },
          icon: const Icon(Icons.refresh),
        ),
        const SizedBox(width: 8),
      ],
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FadeSlideIn(
            index: 0,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appLocalizations.panelEmail,
                      style: context.textTheme.labelMedium?.toLight,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      userInfo.value?.email ?? '',
                      style: context.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 1,
            child: Card(
              child: ListTile(
                title: Text(
                  '${appLocalizations.panelTraffic} ${_trafficText(userInfo.value, subscribeInfo.value)}',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const TrafficLogView(),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 2,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subscribeInfo.value?.plan?.name ??
                          appLocalizations.panelNoSubscription,
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${appLocalizations.panelExpiry} ${_expiryText(userInfo.value, subscribeInfo.value)}',
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 3,
            child: Card(
              child: Column(
                children: [
                  ListItem.open(
                    leading: const Icon(Icons.storefront),
                    title: Text(appLocalizations.panelShop),
                    widget: const ShopView(),
                    forceFull: false,
                  ),
                  const Divider(height: 0),
                  ListItem.open(
                    leading: const Icon(Icons.receipt_long),
                    title: Text(appLocalizations.panelOrders),
                    widget: const OrdersView(),
                    forceFull: false,
                  ),
                  const Divider(height: 0),
                  ListItem.open(
                    leading: const Icon(Icons.support_agent),
                    title: Text(appLocalizations.panelTickets),
                    widget: const TicketsView(),
                    forceFull: false,
                  ),
                  const Divider(height: 0),
                  ListItem.open(
                    leading: const Icon(Icons.group_add),
                    title: Text(appLocalizations.panelInvite),
                    widget: const InviteView(),
                    forceFull: false,
                  ),
                  const Divider(height: 0),
                  ListItem.open(
                    leading: const Icon(Icons.settings),
                    title: Text(appLocalizations.tools),
                    widget: const ToolsView(),
                    forceFull: false,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 4,
            child: FilledButton.tonal(
              onPressed: () async {
                final confirmed = await globalState.showMessage(
                  title: appLocalizations.panelLogout,
                  message: TextSpan(
                    text: appLocalizations.panelLogoutConfirm,
                  ),
                );
                if (confirmed == true) {
                  ref.read(panelActionProvider.notifier).logout();
                }
              },
              child: Text(appLocalizations.panelLogout),
            ),
          ),
        ],
      ),
    );
  }

  String _trafficText(
    PanelUserInfo? userInfo,
    PanelSubscribeInfo? subscribeInfo,
  ) {
    final u = userInfo?.u ?? subscribeInfo?.u ?? 0;
    final d = userInfo?.d ?? subscribeInfo?.d ?? 0;
    final total =
        userInfo?.transferEnable ?? subscribeInfo?.transferEnable ?? 0;
    return '${(u + d).traffic.show} / ${total.traffic.show}';
  }

  String _expiryText(
    PanelUserInfo? userInfo,
    PanelSubscribeInfo? subscribeInfo,
  ) {
    final expiredAt = userInfo?.expiredAt ?? subscribeInfo?.expiredAt;
    if (expiredAt == null || expiredAt == 0) {
      return currentAppLocalizations.infiniteTime;
    }
    return DateTime.fromMillisecondsSinceEpoch(
      expiredAt * 1000,
    ).show;
  }
}

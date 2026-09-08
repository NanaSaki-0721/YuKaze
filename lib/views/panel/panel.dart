import 'dart:async';

import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/views/panel/services.dart';
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

class _AuthSplitLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final VoidCallback? onBack;

  const _AuthSplitLayout({
    required this.title,
    required this.subtitle,
    required this.child,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.appLocalizations;
    final siteName = SiteConfig.siteName.isEmpty
        ? appName
        : SiteConfig.siteName;
    final shadTheme = ShadTheme.of(context);
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: LayoutBuilder(
        builder: (_, constraints) {
          final isSplit = constraints.maxWidth >= authSplitMinWidth;
          final formPane = SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isSplit ? 48 : 32,
                  vertical: 40,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FadeSlideIn(
                        index: 0,
                        child: Column(
                          crossAxisAlignment: isSplit
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.center,
                          children: [
                            if (isSplit) ...[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.asset(
                                  'assets/images/icon.png',
                                  width: 52,
                                  height: 52,
                                ),
                              ),
                              const SizedBox(height: 28),
                            ],
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (onBack != null) ...[
                                  ShadButton.ghost(
                                    height: 40,
                                    padding: EdgeInsets.zero,
                                    width: 40,
                                    onPressed: onBack,
                                    child: const Icon(Icons.arrow_back),
                                  ),
                                  const SizedBox(width: 12),
                                ],
                                Expanded(
                                  child: Text(
                                    title,
                                    textAlign: isSplit
                                        ? TextAlign.start
                                        : TextAlign.center,
                                    style: context.textTheme.headlineMedium
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.only(
                                left: onBack == null ? 0 : 52,
                              ),
                              child: Text(
                                subtitle,
                                textAlign: isSplit
                                    ? TextAlign.start
                                    : TextAlign.center,
                                style: context.textTheme.bodyMedium?.toLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      ShadTheme(
                        data: shadTheme.copyWith(
                          inputTheme: shadTheme.inputTheme.copyWith(
                            constraints: const BoxConstraints(minHeight: 40),
                            decoration: const ShadDecoration(
                              disableSecondaryBorder: true,
                            ),
                          ),
                        ),
                        child: child,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
          if (!isSplit) {
            return formPane;
          }
          return Row(
            children: [
              Expanded(
                flex: 6,
                child: Stack(
                  key: const Key('auth-split-visual'),
                  fit: StackFit.expand,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xff25101d),
                            brandPrimary.withValues(alpha: 0.9),
                            const Color(0xff601d45),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -180,
                      right: -100,
                      child: Container(
                        width: 520,
                        height: 520,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.white.withValues(alpha: 0.26),
                              Colors.white.withValues(alpha: 0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -250,
                      left: -170,
                      child: Container(
                        width: 600,
                        height: 600,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              const Color(0xffffbfd8).withValues(alpha: 0.22),
                              const Color(0xffffbfd8).withValues(alpha: 0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.08),
                            Colors.black.withValues(alpha: 0.34),
                          ],
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/icon.png',
                                    width: 34,
                                    height: 34,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  siteName,
                                  style: context.textTheme.headlineSmall
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        shadows: const [
                                          Shadow(
                                            blurRadius: 12,
                                            color: Colors.black45,
                                          ),
                                        ],
                                      ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              appLocalizations.authSplitGreeting,
                              style: context.textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                shadows: const [
                                  Shadow(blurRadius: 16, color: Colors.black45),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 400),
                              child: Text(
                                appLocalizations.authSplitDescription,
                                style: context.textTheme.bodyLarge?.copyWith(
                                  color: Colors.white.withValues(alpha: 0.84),
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: KeyedSubtree(
                  key: const Key('auth-form-pane'),
                  child: formPane,
                ),
              ),
            ],
          );
        },
      ),
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
      globalState.showNotifier(appLocalizations.panelInputRequired);
      return;
    }
    setState(() {
      _submitting = true;
    });
    try {
      final challenge = _challenge;
      if (challenge == null) {
        final nextChallenge = await ref
            .read(panelActionProvider.notifier)
            .login(email: email, password: password);
        if (nextChallenge != null) {
          setState(() {
            _challenge = nextChallenge;
          });
        }
      } else {
        final code = _codeController.text.trim();
        if (code.isEmpty) {
          globalState.showNotifier(appLocalizations.panelInputRequired);
          return;
        }
        await ref
            .read(panelActionProvider.notifier)
            .verify2fa(challenge: challenge, code: code);
      }
    } catch (error) {
      globalState.showNotifier(error.toString());
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
    return _AuthSplitLayout(
      title: appLocalizations.panelLogin,
      subtitle: appLocalizations.authSplitLoginSubtitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadeSlideIn(
            index: 1,
            child: ShadInput(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              leading: const Icon(Icons.alternate_email_rounded, size: 18),
              placeholder: Text(appLocalizations.panelEmail),
            ),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 2,
            child: ShadInput(
              controller: _passwordController,
              obscureText: true,
              leading: const Icon(Icons.lock_outline_rounded, size: 18),
              placeholder: Text(appLocalizations.panelPassword),
              onSubmitted: (_) => _handleSubmit(),
            ),
          ),
          if (challenge != null) ...[
            const SizedBox(height: 12),
            FadeSlideIn(
              index: 3,
              child: ShadInput(
                controller: _codeController,
                keyboardType: TextInputType.number,
                leading: const Icon(Icons.shield_outlined, size: 18),
                placeholder: Text(appLocalizations.panelTwoFactorCode),
                onSubmitted: (_) => _handleSubmit(),
              ),
            ),
          ],
          const SizedBox(height: 36),
          FadeSlideIn(
            index: 4,
            child: ShadButton(
              enabled: !_submitting,
              onPressed: _handleSubmit,
              child: Text(
                challenge == null
                    ? appLocalizations.panelLogin
                    : appLocalizations.confirm,
              ),
            ),
          ),
          const SizedBox(height: 8),
          FadeSlideIn(
            index: 5,
            child: ShadButton.outline(
              enabled: !_submitting,
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const RegisterView()));
              },
              child: Text(appLocalizations.panelRegister),
            ),
          ),
        ],
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
    final suffixes = _whitelistSuffixes(ref.read(siteConfigInfoProvider).value);
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
      await ref
          .read(panelActionProvider.notifier)
          .register(
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
      return ShadInput(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        leading: const Icon(Icons.alternate_email_rounded, size: 18),
        placeholder: Text(appLocalizations.panelEmail),
      );
    }
    final suffix = _selectedSuffix ?? suffixes.first;
    return Row(
      children: [
        Expanded(
          child: ShadInput(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            leading: const Icon(Icons.alternate_email_rounded, size: 18),
            placeholder: Text(appLocalizations.panelEmail),
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
    final tosUrl = config?.tosUrl;
    return _AuthSplitLayout(
      title: appLocalizations.panelRegister,
      subtitle: appLocalizations.authSplitRegisterSubtitle,
      onBack: () {
        Navigator.of(context).pop();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadeSlideIn(index: 1, child: _buildEmailField(context, config)),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 2,
            child: ShadInput(
              controller: _passwordController,
              obscureText: true,
              leading: const Icon(Icons.lock_outline_rounded, size: 18),
              placeholder: Text(appLocalizations.panelPassword),
            ),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 3,
            child: ShadInput(
              controller: _confirmPasswordController,
              obscureText: true,
              leading: const Icon(Icons.lock_outline_rounded, size: 18),
              placeholder: Text(appLocalizations.panelConfirmPassword),
            ),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 4,
            child: Row(
              children: [
                Expanded(
                  child: ShadInput(
                    controller: _emailCodeController,
                    keyboardType: TextInputType.number,
                    leading: const Icon(
                      Icons.mark_email_read_outlined,
                      size: 18,
                    ),
                    placeholder: Text(appLocalizations.panelEmailCode),
                  ),
                ),
                const SizedBox(width: 8),
                ShadButton.outline(
                  enabled: !_submitting && _cooldown == 0,
                  height: 40,
                  onPressed: _handleSendCode,
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
            index: 5,
            child: ShadInput(
              controller: _inviteCodeController,
              leading: const Icon(Icons.confirmation_number_outlined, size: 18),
              placeholder: Text(appLocalizations.panelInviteCode),
            ),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            index: 6,
            child: ShadCheckbox(
              value: _agreeTerms,
              label: tosUrl == null
                  ? Text(appLocalizations.panelAgreeTerms)
                  : Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(appLocalizations.panelAgreeTermsPrefix),
                        GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse(tosUrl));
                          },
                          child: Text(
                            appLocalizations.panelTermsOfService,
                            style: TextStyle(
                              color: context.colorScheme.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Text(appLocalizations.panelAgreeTermsSuffix),
                      ],
                    ),
              onChanged: (value) {
                setState(() {
                  _agreeTerms = value;
                });
              },
            ),
          ),
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
          const SizedBox(height: 20),
          FadeSlideIn(
            index: 7,
            child: ShadButton(
              enabled: !_submitting,
              onPressed: _handleRegister,
              child: Text(appLocalizations.panelRegister),
            ),
          ),
        ],
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
                    MaterialPageRoute(builder: (_) => const TrafficLogView()),
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
                  message: TextSpan(text: appLocalizations.panelLogoutConfirm),
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
    return DateTime.fromMillisecondsSinceEpoch(expiredAt * 1000).show;
  }
}

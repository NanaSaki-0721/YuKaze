import 'dart:convert';

import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class PanelPlanFeature {
  final String text;
  final bool support;

  const PanelPlanFeature({required this.text, required this.support});
}

List<PanelPlanFeature> parsePlanContent(String? content) {
  if (content == null || content.isEmpty) {
    return [];
  }
  try {
    final parsed = jsonDecode(content);
    if (parsed is! List) {
      return [];
    }
    return parsed.whereType<Object>().map((item) {
      if (item is Map) {
        final feature = item['feature'];
        final support = item['support'];
        return PanelPlanFeature(
          text: feature?.toString() ?? '',
          support: support == null || support == true || support == 1,
        );
      }
      return PanelPlanFeature(text: item.toString(), support: true);
    }).where((feature) => feature.text.isNotEmpty).toList();
  } catch (_) {
    return [PanelPlanFeature(text: content, support: true)];
  }
}

const _periodOrder = [
  ('three_year_price', 'panelPeriodThreeYear'),
  ('two_year_price', 'panelPeriodTwoYear'),
  ('year_price', 'panelPeriodYear'),
  ('half_year_price', 'panelPeriodHalfYear'),
  ('quarter_price', 'panelPeriodQuarter'),
  ('month_price', 'panelPeriodMonth'),
  ('onetime_price', 'panelPeriodOnetime'),
  ('reset_price', 'panelPeriodReset'),
];

int? planPeriodPrice(PanelPlan plan, String period) {
  return switch (period) {
    'three_year_price' => plan.threeYearPrice,
    'two_year_price' => plan.twoYearPrice,
    'year_price' => plan.yearPrice,
    'half_year_price' => plan.halfYearPrice,
    'quarter_price' => plan.quarterPrice,
    'month_price' => plan.monthPrice,
    'onetime_price' => plan.onetimePrice,
    'reset_price' => plan.resetPrice,
    _ => null,
  };
}

String? defaultPeriodForPlan(PanelPlan plan) {
  for (final entry in _periodOrder) {
    final price = planPeriodPrice(plan, entry.$1);
    if (price != null && price > 0) {
      return entry.$1;
    }
  }
  return null;
}

List<String> availablePeriodsForPlan(PanelPlan plan) {
  return [
    for (final entry in _periodOrder)
      if ((planPeriodPrice(plan, entry.$1) ?? 0) > 0) entry.$1,
  ];
}

String _formatAmount(int fen) {
  return (fen / 100).toStringAsFixed(2);
}

String formatPeriodLabel(BuildContext context, String period) {
  final appLocalizations = context.appLocalizations;
  for (final entry in _periodOrder) {
    if (entry.$1 == period) {
      return switch (period) {
        'three_year_price' => appLocalizations.panelPeriodThreeYear,
        'two_year_price' => appLocalizations.panelPeriodTwoYear,
        'year_price' => appLocalizations.panelPeriodYear,
        'half_year_price' => appLocalizations.panelPeriodHalfYear,
        'quarter_price' => appLocalizations.panelPeriodQuarter,
        'month_price' => appLocalizations.panelPeriodMonth,
        'onetime_price' => appLocalizations.panelPeriodOnetime,
        'reset_price' => appLocalizations.panelPeriodReset,
        _ => period,
      };
    }
  }
  return period;
}

class _PeriodTile extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _PeriodTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        alignment: Alignment.center,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: selected
              ? context.colorScheme.secondaryContainer
              : context.colorScheme.surfaceContainer,
          border: Border.all(
            color: selected
                ? context.colorScheme.primary
                : context.colorScheme.outline,
          ),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class ShopView extends ConsumerWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = context.appLocalizations;
    final plans = ref.watch(plansProvider);
    return CommonScaffold(
      title: appLocalizations.panelShop,
      actions: [
        IconButton.filledTonal(
          onPressed: () {
            ref.read(plansProvider.notifier).refresh();
          },
          icon: const Icon(Icons.refresh),
        ),
        const SizedBox(width: 8),
      ],
      body: plans.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => NullStatus(label: error.toString()),
        data: (items) {
          final visible = items.where((plan) => (plan.show ?? 1) != 0).toList();
          if (visible.isEmpty) {
            return NullStatus(label: appLocalizations.panelNoPlans);
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              for (final plan in visible) _buildPlanCard(context, ref, plan),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPlanCard(
    BuildContext context,
    WidgetRef ref,
    PanelPlan plan,
  ) {
    final appLocalizations = context.appLocalizations;
    final features = parsePlanContent(plan.content);
    final periods = availablePeriodsForPlan(plan);
    final soldOut = (plan.capacityLimit ?? 1) == 0;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(plan.name ?? '', style: context.textTheme.titleMedium),
            const SizedBox(height: 8),
            if (plan.transferEnable != null || plan.deviceLimit != null)
              Text(
                [
                  if (plan.transferEnable != null)
                    '${appLocalizations.panelPlanTraffic} ${plan.transferEnable}GB',
                  if (plan.deviceLimit != null)
                    '${appLocalizations.panelPlanDevices} ${plan.deviceLimit}',
                ].join(' · '),
                style: context.textTheme.bodyMedium,
              ),
            if (features.isNotEmpty) ...[
              const SizedBox(height: 8),
              for (final feature in features)
                Row(
                  children: [
                    Icon(
                      feature.support ? Icons.check : Icons.close,
                      size: 16,
                      color: feature.support
                          ? context.colorScheme.primary
                          : context.colorScheme.outline,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        feature.text,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: feature.support
                              ? null
                              : context.colorScheme.outline,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 44,
              ),
              itemCount: periods.length,
              itemBuilder: (_, index) {
                final period = periods[index];
                return _PeriodTile(
                  label:
                      '${formatPeriodLabel(context, period)} '
                      '${_formatAmount(planPeriodPrice(plan, period) ?? 0)}',
                  selected: false,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => OrderConfirmView(planId: plan.id),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: soldOut
                  ? null
                  : () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => OrderConfirmView(planId: plan.id),
                        ),
                      );
                    },
              child: Text(
                soldOut ? appLocalizations.panelSoldOut : appLocalizations.panelBuy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderConfirmView extends ConsumerStatefulWidget {
  final int? planId;

  const OrderConfirmView({super.key, required this.planId});

  @override
  ConsumerState createState() => _OrderConfirmViewState();
}

class _OrderConfirmViewState extends ConsumerState<OrderConfirmView> {
  final _couponController = TextEditingController();
  String? _selectedPeriod;
  String? _error;
  bool _submitting = false;

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.appLocalizations;
    final plans = ref.watch(plansProvider).value ?? [];
    PanelPlan? plan;
    for (final item in plans) {
      if (item.id == widget.planId) {
        plan = item;
        break;
      }
    }
    if (plan == null) {
      return CommonScaffold(
        title: appLocalizations.panelOrderConfirm,
        body: NullStatus(label: appLocalizations.noData),
      );
    }
    final periods = availablePeriodsForPlan(plan);
    final selectedPeriod = _selectedPeriod ?? defaultPeriodForPlan(plan);
    final selectedPrice = selectedPeriod == null
        ? null
        : planPeriodPrice(plan, selectedPeriod);
    return CommonScaffold(
      title: appLocalizations.panelOrderConfirm,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(plan.name ?? '', style: context.textTheme.titleMedium),
          const SizedBox(height: 16),
          Text(
            appLocalizations.panelPeriod,
            style: context.textTheme.labelMedium?.toLight,
          ),
          const SizedBox(height: 8),
          for (final period in periods) ...[
            _PeriodTile(
              label:
                  '${formatPeriodLabel(context, period)} '
                  '${_formatAmount(planPeriodPrice(plan, period) ?? 0)}',
              selected: selectedPeriod == period,
              onTap: () {
                setState(() {
                  _selectedPeriod = period;
                });
              },
            ),
            const SizedBox(height: 8),
          ],
          const SizedBox(height: 16),
          TextField(
            controller: _couponController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: appLocalizations.panelCoupon,
            ),
          ),
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
          FilledButton(
            onPressed: _submitting || selectedPeriod == null
                ? null
                : () async {
                    setState(() {
                      _submitting = true;
                      _error = null;
                    });
                    try {
                      final tradeNo = await ref.read(
                        panelApiProvider,
                      ).saveOrder(
                        planId: plan?.id ?? 0,
                        period: selectedPeriod,
                        couponCode: _couponController.text.trim(),
                      );
                      if (context.mounted) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => PaymentView(tradeNo: tradeNo),
                          ),
                        );
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
                  },
            child: Text(
              selectedPrice == null
                  ? appLocalizations.panelOrderSubmit
                  : '${appLocalizations.panelOrderSubmit} '
                        '${_formatAmount(selectedPrice)}',
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentView extends ConsumerStatefulWidget {
  final String tradeNo;

  const PaymentView({super.key, required this.tradeNo});

  @override
  ConsumerState createState() => _PaymentViewState();
}

class _PaymentViewState extends ConsumerState<PaymentView> {
  String? _selectedMethod;
  String? _error;
  bool _submitting = false;
  bool _checking = false;

  Future<void> _checkOrderStatus() async {
    setState(() {
      _checking = true;
    });
    try {
      final data = await ref.read(panelApiProvider).checkOrderStatus(
        widget.tradeNo,
      );
      var paid = data == true || data == 1;
      if (!paid) {
        final orders = await ref.read(panelApiProvider).fetchOrders();
        for (final order in orders) {
          if (order.tradeNo == widget.tradeNo && (order.status ?? 0) != 0) {
            paid = true;
            break;
          }
        }
      }
      if (!mounted) {
        return;
      }
      if (paid) {
        globalState.showMessage(
          title: context.appLocalizations.panelPaymentSuccess,
          message: const TextSpan(text: ''),
        );
        ref.read(ordersProvider.notifier).refresh();
        if (mounted) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
      } else {
        globalState.showMessage(
          title: context.appLocalizations.panelCheckOrder,
          message: TextSpan(
            text: context.appLocalizations.panelPaymentPending,
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        globalState.showMessage(
          title: context.appLocalizations.panelCheckOrder,
          message: TextSpan(text: error.toString()),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _checking = false;
        });
      }
    }
  }

  Future<void> _handlePay() async {
    final methods = ref.read(paymentMethodsProvider).value ?? [];
    final enabledMethods = methods
        .where((method) => method.enable != false)
        .toList();
    final method = _selectedMethod ??
        (enabledMethods.isEmpty ? null : enabledMethods.first.id);
    if (method == null) {
      return;
    }
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      final result = await ref.read(panelApiProvider).checkoutOrder(
        tradeNo: widget.tradeNo,
        method: method,
      );
      if (!mounted) {
        return;
      }
      final appLocalizations = context.appLocalizations;
      if (result.type == 1 && result.data is String) {
        final url = result.data as String;
        var opened = await launchUrl(Uri.parse(url));
        if (!opened) {
          opened = await launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication,
          );
        }
        final confirmed = await globalState.showMessage(
          title: appLocalizations.panelPayment,
          message: TextSpan(
            text: opened
                ? '${appLocalizations.panelPaymentOpened}\n$url'
                : url,
          ),
          confirmText: appLocalizations.panelCheckOrder,
          cancelText: appLocalizations.panelCopyLink,
        );
        if (confirmed == true) {
          await _checkOrderStatus();
        } else if (confirmed == false) {
          Clipboard.setData(ClipboardData(text: url));
          globalState.showNotifier(currentAppLocalizations.panelCopied);
        }
      } else if (result.type == 0 && result.data is String) {
        final content = result.data as String;
        final confirmed = await globalState.showMessage(
          title: appLocalizations.panelPayment,
          message: TextSpan(text: content),
          confirmText: appLocalizations.panelCheckOrder,
          cancelText: appLocalizations.panelCopyLink,
        );
        if (confirmed == true) {
          await _checkOrderStatus();
        } else if (confirmed == false) {
          Clipboard.setData(ClipboardData(text: content));
          globalState.showNotifier(currentAppLocalizations.panelCopied);
        }
      } else if (result.data == true) {
        globalState.showMessage(
          title: appLocalizations.panelPaymentSuccess,
          message: const TextSpan(text: ''),
        );
        ref.read(ordersProvider.notifier).refresh();
        if (mounted) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
      } else {
        setState(() {
          _error = result.data?.toString() ?? appLocalizations.panelPaymentPending;
        });
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
    final methods = ref.watch(paymentMethodsProvider).value ?? [];
    final enabledMethods = methods.where((method) => method.enable != false);
    final selectedMethod = _selectedMethod ??
        (enabledMethods.isEmpty ? null : enabledMethods.first.id);
    return CommonScaffold(
      title: appLocalizations.panelPayment,
      actions: [
        TextButton(
          onPressed: _checking ? null : _checkOrderStatus,
          child: Text(appLocalizations.panelCheckOrder),
        ),
        const SizedBox(width: 8),
      ],
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            '${appLocalizations.panelOrders} ${widget.tradeNo}',
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Text(
            appLocalizations.panelPaymentMethod,
            style: context.textTheme.labelMedium?.toLight,
          ),
          const SizedBox(height: 8),
          RadioGroup<String>(
            groupValue: selectedMethod,
            onChanged: (value) {
              setState(() {
                _selectedMethod = value;
              });
            },
            child: Column(
              children: [
                for (final method in enabledMethods)
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    title: Text(method.name ?? ''),
                    value: method.id ?? '',
                  ),
              ],
            ),
          ),
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
          FilledButton(
            onPressed: _submitting || selectedMethod == null
                ? null
                : _handlePay,
            child: Text(appLocalizations.panelGoPay),
          ),
        ],
      ),
    );
  }
}

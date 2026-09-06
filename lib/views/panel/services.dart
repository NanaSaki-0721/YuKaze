import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/state.dart';
import 'package:fl_clash/views/panel/shop.dart';
import 'package:fl_clash/views/panel/traffic_chart.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

String _orderStatusText(int? status) {
  return switch (status) {
    0 => currentAppLocalizations.panelOrderPending,
    1 => currentAppLocalizations.panelOrderPaid,
    2 => currentAppLocalizations.panelOrderCancelled,
    3 => currentAppLocalizations.panelOrderCompleted,
    4 => currentAppLocalizations.panelOrderDeducted,
    _ => currentAppLocalizations.unknown,
  };
}

String _formatAmount(int fen) {
  return (fen / 100).toStringAsFixed(2);
}

String _formatDate(int? timestamp) {
  if (timestamp == null || timestamp == 0) {
    return '';
  }
  return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).show;
}

String _ticketStatusText(int? status) {
  return switch (status) {
    0 => currentAppLocalizations.panelTicketStatusOpen,
    1 => currentAppLocalizations.panelTicketStatusAnswered,
    2 => currentAppLocalizations.panelTicketStatusClosed,
    _ => currentAppLocalizations.unknown,
  };
}

class OrdersView extends ConsumerStatefulWidget {
  const OrdersView({super.key});

  @override
  ConsumerState createState() => _OrdersViewState();
}

class _OrdersViewState extends ConsumerState<OrdersView> {
  @override
  void initState() {
    super.initState();
    ref.read(ordersProvider.notifier).refresh();
  }

  Future<void> _cancelOrder(PanelOrder order) async {
    final appLocalizations = context.appLocalizations;
    final confirmed = await globalState.showMessage(
      title: appLocalizations.panelOrders,
      message: TextSpan(text: appLocalizations.panelCancelOrderConfirm),
    );
    if (confirmed != true) {
      return;
    }
    try {
      await ref.read(panelApiProvider).cancelOrder(order.tradeNo ?? '');
      await ref.read(ordersProvider.notifier).refresh();
    } catch (error) {
      if (context.mounted) {
        globalState.showMessage(
          title: appLocalizations.panelOrders,
          message: TextSpan(text: error.toString()),
        );
      }
    }
  }

  Future<void> _openPayment(PanelOrder order) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PaymentView(tradeNo: order.tradeNo ?? ''),
      ),
    );
    ref.read(ordersProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.appLocalizations;
    final orders = ref.watch(ordersProvider);
    final plans = ref.watch(plansProvider).value ?? [];
    final planNames = <int, String>{
      for (final plan in plans) plan.id ?? -1: plan.name ?? '',
    };
    return CommonScaffold(
      title: appLocalizations.panelOrders,
      body: orders.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => NullStatus(label: error.toString()),
        data: (items) {
          if (items.isEmpty) {
            return NullStatus(label: appLocalizations.noData);
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (_, index) {
              final order = items[index];
              final planName = planNames[order.planId];
              final periodLabel = formatPeriodLabel(
                context,
                order.period ?? '',
              );
              final titleParts = [
                if (planName != null && planName.isNotEmpty) planName,
                if (order.period != null && order.period!.isNotEmpty)
                  periodLabel,
              ];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      title: Text(
                        titleParts.isEmpty
                            ? order.tradeNo ?? ''
                            : titleParts.join(' · '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        '${order.tradeNo ?? ''}\n'
                        '${_orderStatusText(order.status)} · '
                        '${_formatAmount(order.totalAmount ?? 0)} · '
                        '${_formatDate(order.createdAt)}',
                      ),
                    ),
                    if (order.status == 0)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  _cancelOrder(order);
                                },
                                child: Text(appLocalizations.cancel),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  _openPayment(order);
                                },
                                child: Text(appLocalizations.panelGoPay),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TicketsView extends ConsumerWidget {
  const TicketsView({super.key});

  Future<void> _showCreateTicket(BuildContext context, WidgetRef ref) async {
    final appLocalizations = context.appLocalizations;
    final subjectController = TextEditingController();
    final messageController = TextEditingController();
    var level = 0;
    var error = '';
    final created = await globalState.showCommonDialog<bool>(
      child: StatefulBuilder(
        builder: (context, setState) {
          return CommonDialog(
            title: appLocalizations.panelCreateTicket,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(appLocalizations.cancel),
              ),
              FilledButton(
                onPressed: () async {
                  final subject = subjectController.text.trim();
                  final message = messageController.text.trim();
                  if (subject.isEmpty || message.isEmpty) {
                    setState(() {
                      error = appLocalizations.panelInputRequired;
                    });
                    return;
                  }
                  try {
                    await ref.read(panelApiProvider).createTicket(
                      subject: subject,
                      level: level,
                      message: message,
                    );
                    if (context.mounted) {
                      Navigator.of(context).pop(true);
                    }
                  } catch (e) {
                    setState(() {
                      error = e.toString();
                    });
                  }
                },
                child: Text(appLocalizations.confirm),
              ),
            ],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadRadioGroup<int>(
                  initialValue: level,
                  axis: Axis.horizontal,
                  onChanged: (value) {
                    setState(() {
                      level = value ?? 0;
                    });
                  },
                  items: [
                    ShadRadio<int>(
                      value: 0,
                      label: Text(appLocalizations.panelTicketLevelLow),
                    ),
                    ShadRadio<int>(
                      value: 1,
                      label: Text(appLocalizations.panelTicketLevelMid),
                    ),
                    ShadRadio<int>(
                      value: 2,
                      label: Text(appLocalizations.panelTicketLevelHigh),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: subjectController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: appLocalizations.panelTicketSubject,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: messageController,
                  maxLines: 4,
                  minLines: 2,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: appLocalizations.panelTicketMessage,
                  ),
                ),
                if (error.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    error,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.error,
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
    if (created == true) {
      await ref.read(ticketsProvider.notifier).refresh();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = context.appLocalizations;
    final tickets = ref.watch(ticketsProvider);
    return CommonScaffold(
      title: appLocalizations.panelTickets,
      actions: [
        IconButton.filledTonal(
          onPressed: () {
            _showCreateTicket(context, ref);
          },
          icon: const Icon(Icons.add),
        ),
        const SizedBox(width: 8),
      ],
      body: tickets.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => NullStatus(label: error.toString()),
        data: (items) {
          if (items.isEmpty) {
            return NullStatus(label: appLocalizations.noData);
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (_, index) {
              final ticket = items[index];
              return Card(
                child: ListTile(
                  title: Text(
                    ticket.subject ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    '${_ticketStatusText(ticket.status)} · '
                    '${_formatDate(ticket.updatedAt)}',
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => TicketDetailView(
                          ticketId: ticket.id ?? 0,
                          subject: ticket.subject ?? '',
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TicketDetailView extends ConsumerStatefulWidget {
  final int ticketId;
  final String subject;

  const TicketDetailView({
    super.key,
    required this.ticketId,
    required this.subject,
  });

  @override
  ConsumerState createState() => _TicketDetailViewState();
}

class _TicketDetailViewState extends ConsumerState<TicketDetailView> {
  final _replyController = TextEditingController();
  PanelTicketDetail? _detail;
  String? _error;
  bool _loading = true;
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final detail = await ref.read(panelApiProvider).fetchTicketDetail(
        widget.ticketId,
      );
      setState(() {
        _detail = detail;
      });
    } catch (error) {
      setState(() {
        _error = error.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _sendReply() async {
    final message = _replyController.text.trim();
    if (message.isEmpty) {
      return;
    }
    setState(() {
      _sending = true;
    });
    try {
      await ref.read(panelApiProvider).replyTicket(
        id: widget.ticketId,
        message: message,
      );
      _replyController.clear();
      await _load();
    } catch (error) {
      if (mounted) {
        setState(() {
          _error = error.toString();
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _sending = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.appLocalizations;
    final messages = _detail?.message ?? [];
    final status = _detail?.status;
    final canReply = !_loading && status == 0;
    return CommonScaffold(
      title: appLocalizations.panelTicketDetail,
      body: Column(
        children: [
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      Text(
                        widget.subject,
                        style: context.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _ticketStatusText(status),
                        style: context.textTheme.labelMedium?.toLight,
                      ),
                      const SizedBox(height: 12),
                      if (_error != null) ...[
                        Text(
                          _error!,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.error,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                      for (final message in messages)
                        Align(
                          alignment: (message.isMe ?? false)
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(12),
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.sizeOf(context).width * 0.78,
                            ),
                            decoration: BoxDecoration(
                              color: (message.isMe ?? false)
                                  ? context.colorScheme.secondaryContainer
                                  : context.colorScheme.surfaceContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(message.message ?? ''),
                                const SizedBox(height: 4),
                                Text(
                                  _formatDate(message.createdAt),
                                  style: context.textTheme.labelSmall?.toLight,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: _loading
                  ? const SizedBox.shrink()
                  : canReply
                  ? Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _replyController,
                            maxLines: 3,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: appLocalizations.panelTicketReplyHint,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        FilledButton(
                          onPressed: _sending ? null : _sendReply,
                          child: Text(appLocalizations.submit),
                        ),
                      ],
                    )
                  : Text(
                      appLocalizations.panelTicketClosedHint,
                      style: context.textTheme.bodyMedium?.toLight,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class InviteView extends ConsumerWidget {
  const InviteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = context.appLocalizations;
    final invite = ref.watch(inviteInfoProvider);
    return CommonScaffold(
      title: appLocalizations.panelInvite,
      body: invite.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => NullStatus(label: error.toString()),
        data: (info) {
          final codes = info?.codes ?? [];
          final stat = info?.stat ?? [];
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (stat.isNotEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${appLocalizations.panelInviteRegistered} ${stat[0]}',
                          style: context.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${appLocalizations.panelInviteAvailableCommission} ${_formatAmount(stat.length > 4 ? stat[4] : 0)}',
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 12),
              FilledButton.tonal(
                onPressed: () async {
                  try {
                    await ref.read(panelApiProvider).saveInvite();
                    await ref.read(inviteInfoProvider.notifier).refresh();
                  } catch (error) {
                    if (context.mounted) {
                      globalState.showMessage(
                        title: appLocalizations.tip,
                        message: TextSpan(text: error.toString()),
                      );
                    }
                  }
                },
                child: Text(appLocalizations.panelInviteGenerate),
              ),
              const SizedBox(height: 12),
              if (codes.isEmpty)
                NullStatus(label: appLocalizations.panelNoInviteCode)
              else
                for (final code in codes)
                  Card(
                    child: ListTile(
                      title: Text(
                        code.code ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: code.code ?? ''),
                          );
                          globalState.showNotifier(
                            currentAppLocalizations.panelCopied,
                          );
                        },
                        icon: const Icon(Icons.copy),
                      ),
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }
}

class TrafficLogView extends ConsumerWidget {
  const TrafficLogView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = context.appLocalizations;
    final records = ref.watch(trafficLogProvider);
    return CommonScaffold(
      title: appLocalizations.panelTrafficLog,
      actions: [
        IconButton.filledTonal(
          onPressed: () {
            ref.read(trafficLogProvider.notifier).refresh();
          },
          icon: const Icon(Icons.refresh),
        ),
        const SizedBox(width: 8),
      ],
      body: records.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => NullStatus(label: error.toString()),
        data: (items) {
          if (items.isEmpty) {
            return NullStatus(label: appLocalizations.noData);
          }
          final sorted = List<PanelTrafficRecord>.from(items)
            ..sort((a, b) => (b.recordAt ?? 0).compareTo(a.recordAt ?? 0));
          final chartSeries = buildDailyTrafficSeries(items);
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (!chartSeries.isEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appLocalizations.panelTrafficLogChart,
                          style: context.textTheme.labelMedium?.toLight,
                        ),
                        const SizedBox(height: 12),
                        TrafficChart(
                          series: chartSeries,
                          uploadColor: context.colorScheme.tertiary,
                          downloadColor: context.colorScheme.primary,
                          totalColor: context.colorScheme.secondary,
                          uploadLabel: appLocalizations.upload,
                          downloadLabel: appLocalizations.download,
                          totalLabel: appLocalizations.panelTrafficLogTotal,
                        ),
                      ],
                    ),
                  ),
                ),
              for (final record in sorted)
                Card(
                  child: ListTile(
                    title: Text(_formatDate(record.recordAt)),
                    subtitle: Text(
                      '${appLocalizations.upload} ${(record.u ?? 0).traffic.show} · '
                      '${appLocalizations.download} ${(record.d ?? 0).traffic.show}',
                    ),
                    trailing: Text(
                      '${appLocalizations.panelTrafficLogRate} ${record.serverRate ?? 1}x',
                      style: context.textTheme.labelMedium?.toLight,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

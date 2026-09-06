part of '../panel.dart';

@Riverpod(keepAlive: true)
PanelApi panelApi(Ref ref) {
  return PanelApi();
}

@Riverpod(keepAlive: true)
class SiteConfigInfo extends _$SiteConfigInfo {
  @override
  Future<PanelSiteConfig?> build() {
    return ref.read(panelApiProvider).getSiteConfig();
  }
}

@Riverpod(keepAlive: true)
class UserInfo extends _$UserInfo {
  @override
  Future<PanelUserInfo?> build() async {
    final session = ref.watch(panelSessionProvider);
    if (session.value == null) {
      return null;
    }
    return ref.read(panelApiProvider).getUserInfo();
  }

  Future<void> refresh() async {
    if (ref.read(panelSessionProvider).value == null) {
      state = const AsyncData(null);
      return;
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(panelApiProvider).getUserInfo(),
    );
  }
}

@Riverpod(keepAlive: true)
class SubscribeInfo extends _$SubscribeInfo {
  @override
  Future<PanelSubscribeInfo?> build() async {
    final session = ref.watch(panelSessionProvider);
    if (session.value == null) {
      return null;
    }
    return ref.read(panelApiProvider).getSubscribe();
  }

  Future<void> refresh() async {
    if (ref.read(panelSessionProvider).value == null) {
      state = const AsyncData(null);
      return;
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(panelApiProvider).getSubscribe(),
    );
  }
}

@Riverpod(keepAlive: true)
class Orders extends _$Orders {
  @override
  Future<List<PanelOrder>> build() async {
    return ref.read(panelApiProvider).fetchOrders();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(panelApiProvider).fetchOrders(),
    );
  }
}

@Riverpod(keepAlive: true)
class Tickets extends _$Tickets {
  @override
  Future<List<PanelTicket>> build() async {
    return ref.read(panelApiProvider).fetchTickets();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(panelApiProvider).fetchTickets(),
    );
  }
}

@Riverpod(keepAlive: true)
class InviteInfo extends _$InviteInfo {
  @override
  Future<PanelInvite?> build() async {
    return ref.read(panelApiProvider).fetchInvite();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(panelApiProvider).fetchInvite(),
    );
  }
}

@Riverpod(keepAlive: true)
class TrafficLog extends _$TrafficLog {
  @override
  Future<List<PanelTrafficRecord>> build() async {
    return ref.read(panelApiProvider).fetchTrafficLog();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(panelApiProvider).fetchTrafficLog(),
    );
  }
}

@Riverpod(keepAlive: true)
class Plans extends _$Plans {
  @override
  Future<List<PanelPlan>> build() async {
    return ref.read(panelApiProvider).fetchPlans();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(panelApiProvider).fetchPlans(),
    );
  }
}

@Riverpod(keepAlive: true)
class PaymentMethods extends _$PaymentMethods {
  @override
  Future<List<PanelPaymentMethod>> build() async {
    return ref.read(panelApiProvider).fetchPaymentMethods();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(panelApiProvider).fetchPaymentMethods(),
    );
  }
}

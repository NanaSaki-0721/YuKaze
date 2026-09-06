// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../panel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(panelAuthState)
final panelAuthStateProvider = PanelAuthStateProvider._();

final class PanelAuthStateProvider
    extends $FunctionalProvider<PanelAuthState, PanelAuthState, PanelAuthState>
    with $Provider<PanelAuthState> {
  PanelAuthStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'panelAuthStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$panelAuthStateHash();

  @$internal
  @override
  $ProviderElement<PanelAuthState> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PanelAuthState create(Ref ref) {
    return panelAuthState(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PanelAuthState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PanelAuthState>(value),
    );
  }
}

String _$panelAuthStateHash() => r'7580ffdaf256bc31d8030102a5a33456ec504e45';

@ProviderFor(PanelSession)
final panelSessionProvider = PanelSessionProvider._();

final class PanelSessionProvider
    extends $AsyncNotifierProvider<PanelSession, String?> {
  PanelSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'panelSessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$panelSessionHash();

  @$internal
  @override
  PanelSession create() => PanelSession();
}

String _$panelSessionHash() => r'8e1a07010d26ec59ab10e6b84191eb7aef1d3aaa';

abstract class _$PanelSession extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(PanelProfileId)
final panelProfileIdProvider = PanelProfileIdProvider._();

final class PanelProfileIdProvider
    extends $AsyncNotifierProvider<PanelProfileId, int?> {
  PanelProfileIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'panelProfileIdProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$panelProfileIdHash();

  @$internal
  @override
  PanelProfileId create() => PanelProfileId();
}

String _$panelProfileIdHash() => r'a7e6da081f97737703978a08bf668befa914d097';

abstract class _$PanelProfileId extends $AsyncNotifier<int?> {
  FutureOr<int?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<int?>, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int?>, int?>,
              AsyncValue<int?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(panelApi)
final panelApiProvider = PanelApiProvider._();

final class PanelApiProvider
    extends $FunctionalProvider<PanelApi, PanelApi, PanelApi>
    with $Provider<PanelApi> {
  PanelApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'panelApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$panelApiHash();

  @$internal
  @override
  $ProviderElement<PanelApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PanelApi create(Ref ref) {
    return panelApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PanelApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PanelApi>(value),
    );
  }
}

String _$panelApiHash() => r'bc8b822938ee8a8661a626aa6df8eae42d74a6ca';

@ProviderFor(SiteConfigInfo)
final siteConfigInfoProvider = SiteConfigInfoProvider._();

final class SiteConfigInfoProvider
    extends $AsyncNotifierProvider<SiteConfigInfo, PanelSiteConfig?> {
  SiteConfigInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'siteConfigInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$siteConfigInfoHash();

  @$internal
  @override
  SiteConfigInfo create() => SiteConfigInfo();
}

String _$siteConfigInfoHash() => r'0018c2d4af015b1944ba769fbcce625273dd1fe7';

abstract class _$SiteConfigInfo extends $AsyncNotifier<PanelSiteConfig?> {
  FutureOr<PanelSiteConfig?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<PanelSiteConfig?>, PanelSiteConfig?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PanelSiteConfig?>, PanelSiteConfig?>,
              AsyncValue<PanelSiteConfig?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(UserInfo)
final userInfoProvider = UserInfoProvider._();

final class UserInfoProvider
    extends $AsyncNotifierProvider<UserInfo, PanelUserInfo?> {
  UserInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userInfoHash();

  @$internal
  @override
  UserInfo create() => UserInfo();
}

String _$userInfoHash() => r'bc8db53469cacd416e9f50cb019c907a84d5e262';

abstract class _$UserInfo extends $AsyncNotifier<PanelUserInfo?> {
  FutureOr<PanelUserInfo?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PanelUserInfo?>, PanelUserInfo?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PanelUserInfo?>, PanelUserInfo?>,
              AsyncValue<PanelUserInfo?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(SubscribeInfo)
final subscribeInfoProvider = SubscribeInfoProvider._();

final class SubscribeInfoProvider
    extends $AsyncNotifierProvider<SubscribeInfo, PanelSubscribeInfo?> {
  SubscribeInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subscribeInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subscribeInfoHash();

  @$internal
  @override
  SubscribeInfo create() => SubscribeInfo();
}

String _$subscribeInfoHash() => r'e3b1baa97f8b95a37b5b6ef6e258210ef4ea0939';

abstract class _$SubscribeInfo extends $AsyncNotifier<PanelSubscribeInfo?> {
  FutureOr<PanelSubscribeInfo?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<PanelSubscribeInfo?>, PanelSubscribeInfo?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PanelSubscribeInfo?>, PanelSubscribeInfo?>,
              AsyncValue<PanelSubscribeInfo?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(Orders)
final ordersProvider = OrdersProvider._();

final class OrdersProvider
    extends $AsyncNotifierProvider<Orders, List<PanelOrder>> {
  OrdersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersHash();

  @$internal
  @override
  Orders create() => Orders();
}

String _$ordersHash() => r'5a451227a69c16018e739dc5c066373f3bc6ee14';

abstract class _$Orders extends $AsyncNotifier<List<PanelOrder>> {
  FutureOr<List<PanelOrder>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<PanelOrder>>, List<PanelOrder>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<PanelOrder>>, List<PanelOrder>>,
              AsyncValue<List<PanelOrder>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(Tickets)
final ticketsProvider = TicketsProvider._();

final class TicketsProvider
    extends $AsyncNotifierProvider<Tickets, List<PanelTicket>> {
  TicketsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticketsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticketsHash();

  @$internal
  @override
  Tickets create() => Tickets();
}

String _$ticketsHash() => r'ce9822449f3c6041e421c6f1029ad4edde85039c';

abstract class _$Tickets extends $AsyncNotifier<List<PanelTicket>> {
  FutureOr<List<PanelTicket>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<PanelTicket>>, List<PanelTicket>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<PanelTicket>>, List<PanelTicket>>,
              AsyncValue<List<PanelTicket>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(InviteInfo)
final inviteInfoProvider = InviteInfoProvider._();

final class InviteInfoProvider
    extends $AsyncNotifierProvider<InviteInfo, PanelInvite?> {
  InviteInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inviteInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inviteInfoHash();

  @$internal
  @override
  InviteInfo create() => InviteInfo();
}

String _$inviteInfoHash() => r'917b5a4f06ff3d4c4beaf506c18acc94f2f7a713';

abstract class _$InviteInfo extends $AsyncNotifier<PanelInvite?> {
  FutureOr<PanelInvite?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PanelInvite?>, PanelInvite?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PanelInvite?>, PanelInvite?>,
              AsyncValue<PanelInvite?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(TrafficLog)
final trafficLogProvider = TrafficLogProvider._();

final class TrafficLogProvider
    extends $AsyncNotifierProvider<TrafficLog, List<PanelTrafficRecord>> {
  TrafficLogProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trafficLogProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trafficLogHash();

  @$internal
  @override
  TrafficLog create() => TrafficLog();
}

String _$trafficLogHash() => r'ecf7115880d64c5b06fdf7d1bb217989ae23a911';

abstract class _$TrafficLog extends $AsyncNotifier<List<PanelTrafficRecord>> {
  FutureOr<List<PanelTrafficRecord>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<PanelTrafficRecord>>,
              List<PanelTrafficRecord>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<PanelTrafficRecord>>,
                List<PanelTrafficRecord>
              >,
              AsyncValue<List<PanelTrafficRecord>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(Plans)
final plansProvider = PlansProvider._();

final class PlansProvider
    extends $AsyncNotifierProvider<Plans, List<PanelPlan>> {
  PlansProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'plansProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$plansHash();

  @$internal
  @override
  Plans create() => Plans();
}

String _$plansHash() => r'a48eda557659535d50e2b3f6f8e7ebb1b055b2b8';

abstract class _$Plans extends $AsyncNotifier<List<PanelPlan>> {
  FutureOr<List<PanelPlan>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<PanelPlan>>, List<PanelPlan>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<PanelPlan>>, List<PanelPlan>>,
              AsyncValue<List<PanelPlan>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(PaymentMethods)
final paymentMethodsProvider = PaymentMethodsProvider._();

final class PaymentMethodsProvider
    extends $AsyncNotifierProvider<PaymentMethods, List<PanelPaymentMethod>> {
  PaymentMethodsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentMethodsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentMethodsHash();

  @$internal
  @override
  PaymentMethods create() => PaymentMethods();
}

String _$paymentMethodsHash() => r'e60a9bff8b57a66ca7c852c85317f54e3e915dff';

abstract class _$PaymentMethods
    extends $AsyncNotifier<List<PanelPaymentMethod>> {
  FutureOr<List<PanelPaymentMethod>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<PanelPaymentMethod>>,
              List<PanelPaymentMethod>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<PanelPaymentMethod>>,
                List<PanelPaymentMethod>
              >,
              AsyncValue<List<PanelPaymentMethod>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(PanelAction)
final panelActionProvider = PanelActionProvider._();

final class PanelActionProvider extends $NotifierProvider<PanelAction, void> {
  PanelActionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'panelActionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$panelActionHash();

  @$internal
  @override
  PanelAction create() => PanelAction();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$panelActionHash() => r'b8548b7795c1f416f2fbc3e7abfd8724b34a0645';

abstract class _$PanelAction extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

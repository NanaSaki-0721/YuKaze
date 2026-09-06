import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/panel.freezed.dart';
part 'generated/panel.g.dart';

@freezed
abstract class PanelPlan with _$PanelPlan {
  const factory PanelPlan({
    int? id,
    String? name,
    String? content,
    @JsonKey(name: 'transfer_enable') int? transferEnable,
    @JsonKey(name: 'device_limit') int? deviceLimit,
    @JsonKey(name: 'speed_limit') int? speedLimit,
    @JsonKey(name: 'month_price') int? monthPrice,
    @JsonKey(name: 'quarter_price') int? quarterPrice,
    @JsonKey(name: 'half_year_price') int? halfYearPrice,
    @JsonKey(name: 'year_price') int? yearPrice,
    @JsonKey(name: 'two_year_price') int? twoYearPrice,
    @JsonKey(name: 'three_year_price') int? threeYearPrice,
    @JsonKey(name: 'onetime_price') int? onetimePrice,
    @JsonKey(name: 'reset_price') int? resetPrice,
    int? show,
    int? renew,
    @JsonKey(name: 'capacity_limit') int? capacityLimit,
  }) = _PanelPlan;

  factory PanelPlan.fromJson(Map<String, Object?> json) =>
      _$PanelPlanFromJson(json);
}

@freezed
abstract class PanelPaymentMethod with _$PanelPaymentMethod {
  const factory PanelPaymentMethod({
    @JsonKey(name: 'id', fromJson: _idFromJson) String? id,
    String? name,
    bool? enable,
  }) = _PanelPaymentMethod;

  factory PanelPaymentMethod.fromJson(Map<String, Object?> json) =>
      _$PanelPaymentMethodFromJson(json);
}

String? _idFromJson(Object? value) {
  return value?.toString();
}

@freezed
abstract class PanelSiteConfig with _$PanelSiteConfig {
  const factory PanelSiteConfig({
    @JsonKey(
      name: 'is_email_verify',
      fromJson: _intFromJson,
    )
    @Default(0)
    int isEmailVerify,
    @JsonKey(name: 'is_invite_force', fromJson: _intFromJson)
    @Default(0)
    int isInviteForce,
    @JsonKey(
      name: 'email_whitelist_suffix',
      fromJson: _suffixListFromJson,
      toJson: _suffixListToJson,
    )
    @Default([])
    List<String> emailWhitelistSuffix,
    @JsonKey(name: 'tos_url') String? tosUrl,
  }) = _PanelSiteConfig;

  factory PanelSiteConfig.fromJson(Map<String, Object?> json) =>
      _$PanelSiteConfigFromJson(json);
}

int _intFromJson(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  return 0;
}

List<String> _suffixListFromJson(Object? value) {
  if (value is! List) return [];
  return value.whereType<String>().toList();
}

Object? _suffixListToJson(List<String> value) => value;

@freezed
abstract class PanelOrder with _$PanelOrder {
  const factory PanelOrder({
    @JsonKey(name: 'trade_no') String? tradeNo,
    @JsonKey(name: 'total_amount') int? totalAmount,
    @JsonKey(name: 'plan_id') int? planId,
    String? period,
    int? status,
    @JsonKey(name: 'created_at') int? createdAt,
  }) = _PanelOrder;

  factory PanelOrder.fromJson(Map<String, Object?> json) =>
      _$PanelOrderFromJson(json);
}

@freezed
abstract class PanelTicket with _$PanelTicket {
  const factory PanelTicket({
    int? id,
    String? subject,
    int? level,
    int? status,
    String? message,
    @JsonKey(name: 'created_at') int? createdAt,
    @JsonKey(name: 'updated_at') int? updatedAt,
  }) = _PanelTicket;

  factory PanelTicket.fromJson(Map<String, Object?> json) =>
      _$PanelTicketFromJson(json);
}

@freezed
abstract class PanelTicketMessage with _$PanelTicketMessage {
  const factory PanelTicketMessage({
    int? id,
    String? message,
    @JsonKey(name: 'is_me') bool? isMe,
    @JsonKey(name: 'created_at') int? createdAt,
  }) = _PanelTicketMessage;

  factory PanelTicketMessage.fromJson(Map<String, Object?> json) =>
      _$PanelTicketMessageFromJson(json);
}

@freezed
abstract class PanelTicketDetail with _$PanelTicketDetail {
  const factory PanelTicketDetail({
    int? id,
    String? subject,
    int? level,
    int? status,
    @JsonKey(name: 'created_at') int? createdAt,
    @Default([]) List<PanelTicketMessage> message,
  }) = _PanelTicketDetail;

  factory PanelTicketDetail.fromJson(Map<String, Object?> json) =>
      _$PanelTicketDetailFromJson(json);
}

@freezed
abstract class PanelTrafficRecord with _$PanelTrafficRecord {
  const factory PanelTrafficRecord({
    int? u,
    int? d,
    @JsonKey(name: 'record_at') int? recordAt,
    @JsonKey(name: 'server_rate', fromJson: _rateFromJson) double? serverRate,
  }) = _PanelTrafficRecord;

  factory PanelTrafficRecord.fromJson(Map<String, Object?> json) =>
      _$PanelTrafficRecordFromJson(json);
}

double? _rateFromJson(Object? value) {
  if (value is num) {
    return value.toDouble();
  }
  return double.tryParse(value?.toString() ?? '');
}

@freezed
abstract class PanelInviteCode with _$PanelInviteCode {
  const factory PanelInviteCode({
    String? code,
    @JsonKey(name: 'created_at') int? createdAt,
  }) = _PanelInviteCode;

  factory PanelInviteCode.fromJson(Map<String, Object?> json) =>
      _$PanelInviteCodeFromJson(json);
}

@freezed
abstract class PanelInvite with _$PanelInvite {
  const factory PanelInvite({
    @Default([]) List<PanelInviteCode> codes,
    @Default([]) List<int> stat,
  }) = _PanelInvite;

  factory PanelInvite.fromJson(Map<String, Object?> json) =>
      _$PanelInviteFromJson(json);
}

@freezed
abstract class PanelUserInfo with _$PanelUserInfo {
  const factory PanelUserInfo({
    int? id,
    String? email,
    @JsonKey(name: 'transfer_enable') int? transferEnable,
    int? u,
    int? d,
    @JsonKey(name: 'expired_at') int? expiredAt,
    @JsonKey(name: 'device_limit') int? deviceLimit,
    int? balance,
    @JsonKey(name: 'commission_balance') int? commissionBalance,
    PanelPlan? plan,
  }) = _PanelUserInfo;

  factory PanelUserInfo.fromJson(Map<String, Object?> json) =>
      _$PanelUserInfoFromJson(json);
}

@freezed
abstract class PanelSubscribeInfo with _$PanelSubscribeInfo {
  const factory PanelSubscribeInfo({
    PanelPlan? plan,
    @JsonKey(name: 'subscribe_url') String? subscribeUrl,
    @JsonKey(name: 'expired_at') int? expiredAt,
    int? u,
    int? d,
    @JsonKey(name: 'transfer_enable') int? transferEnable,
    @JsonKey(name: 'reset_day') int? resetDay,
    @JsonKey(name: 'device_limit') int? deviceLimit,
  }) = _PanelSubscribeInfo;

  factory PanelSubscribeInfo.fromJson(Map<String, Object?> json) =>
      _$PanelSubscribeInfoFromJson(json);
}

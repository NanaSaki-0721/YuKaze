// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../panel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PanelPlan _$PanelPlanFromJson(Map<String, dynamic> json) => _PanelPlan(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  content: json['content'] as String?,
  transferEnable: (json['transfer_enable'] as num?)?.toInt(),
  deviceLimit: (json['device_limit'] as num?)?.toInt(),
  speedLimit: (json['speed_limit'] as num?)?.toInt(),
  monthPrice: (json['month_price'] as num?)?.toInt(),
  quarterPrice: (json['quarter_price'] as num?)?.toInt(),
  halfYearPrice: (json['half_year_price'] as num?)?.toInt(),
  yearPrice: (json['year_price'] as num?)?.toInt(),
  twoYearPrice: (json['two_year_price'] as num?)?.toInt(),
  threeYearPrice: (json['three_year_price'] as num?)?.toInt(),
  onetimePrice: (json['onetime_price'] as num?)?.toInt(),
  resetPrice: (json['reset_price'] as num?)?.toInt(),
  show: (json['show'] as num?)?.toInt(),
  renew: (json['renew'] as num?)?.toInt(),
  capacityLimit: (json['capacity_limit'] as num?)?.toInt(),
);

Map<String, dynamic> _$PanelPlanToJson(_PanelPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'content': instance.content,
      'transfer_enable': instance.transferEnable,
      'device_limit': instance.deviceLimit,
      'speed_limit': instance.speedLimit,
      'month_price': instance.monthPrice,
      'quarter_price': instance.quarterPrice,
      'half_year_price': instance.halfYearPrice,
      'year_price': instance.yearPrice,
      'two_year_price': instance.twoYearPrice,
      'three_year_price': instance.threeYearPrice,
      'onetime_price': instance.onetimePrice,
      'reset_price': instance.resetPrice,
      'show': instance.show,
      'renew': instance.renew,
      'capacity_limit': instance.capacityLimit,
    };

_PanelPaymentMethod _$PanelPaymentMethodFromJson(Map<String, dynamic> json) =>
    _PanelPaymentMethod(
      id: _idFromJson(json['id']),
      name: json['name'] as String?,
      enable: json['enable'] as bool?,
    );

Map<String, dynamic> _$PanelPaymentMethodToJson(_PanelPaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'enable': instance.enable,
    };

_PanelSiteConfig _$PanelSiteConfigFromJson(Map<String, dynamic> json) =>
    _PanelSiteConfig(
      isEmailVerify: json['is_email_verify'] == null
          ? 0
          : _intFromJson(json['is_email_verify']),
      isInviteForce: json['is_invite_force'] == null
          ? 0
          : _intFromJson(json['is_invite_force']),
      emailWhitelistSuffix: json['email_whitelist_suffix'] == null
          ? const []
          : _suffixListFromJson(json['email_whitelist_suffix']),
      tosUrl: json['tos_url'] as String?,
    );

Map<String, dynamic> _$PanelSiteConfigToJson(
  _PanelSiteConfig instance,
) => <String, dynamic>{
  'is_email_verify': instance.isEmailVerify,
  'is_invite_force': instance.isInviteForce,
  'email_whitelist_suffix': _suffixListToJson(instance.emailWhitelistSuffix),
  'tos_url': instance.tosUrl,
};

_PanelOrder _$PanelOrderFromJson(Map<String, dynamic> json) => _PanelOrder(
  tradeNo: json['trade_no'] as String?,
  totalAmount: (json['total_amount'] as num?)?.toInt(),
  planId: (json['plan_id'] as num?)?.toInt(),
  period: json['period'] as String?,
  status: (json['status'] as num?)?.toInt(),
  createdAt: (json['created_at'] as num?)?.toInt(),
);

Map<String, dynamic> _$PanelOrderToJson(_PanelOrder instance) =>
    <String, dynamic>{
      'trade_no': instance.tradeNo,
      'total_amount': instance.totalAmount,
      'plan_id': instance.planId,
      'period': instance.period,
      'status': instance.status,
      'created_at': instance.createdAt,
    };

_PanelTicket _$PanelTicketFromJson(Map<String, dynamic> json) => _PanelTicket(
  id: (json['id'] as num?)?.toInt(),
  subject: json['subject'] as String?,
  level: (json['level'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  message: json['message'] as String?,
  createdAt: (json['created_at'] as num?)?.toInt(),
  updatedAt: (json['updated_at'] as num?)?.toInt(),
);

Map<String, dynamic> _$PanelTicketToJson(_PanelTicket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'level': instance.level,
      'status': instance.status,
      'message': instance.message,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_PanelTicketMessage _$PanelTicketMessageFromJson(Map<String, dynamic> json) =>
    _PanelTicketMessage(
      id: (json['id'] as num?)?.toInt(),
      message: json['message'] as String?,
      isMe: json['is_me'] as bool?,
      createdAt: (json['created_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PanelTicketMessageToJson(_PanelTicketMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'is_me': instance.isMe,
      'created_at': instance.createdAt,
    };

_PanelTicketDetail _$PanelTicketDetailFromJson(Map<String, dynamic> json) =>
    _PanelTicketDetail(
      id: (json['id'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      level: (json['level'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      createdAt: (json['created_at'] as num?)?.toInt(),
      message:
          (json['message'] as List<dynamic>?)
              ?.map(
                (e) => PanelTicketMessage.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PanelTicketDetailToJson(_PanelTicketDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'level': instance.level,
      'status': instance.status,
      'created_at': instance.createdAt,
      'message': instance.message,
    };

_PanelTrafficRecord _$PanelTrafficRecordFromJson(Map<String, dynamic> json) =>
    _PanelTrafficRecord(
      u: (json['u'] as num?)?.toInt(),
      d: (json['d'] as num?)?.toInt(),
      recordAt: (json['record_at'] as num?)?.toInt(),
      serverRate: _rateFromJson(json['server_rate']),
    );

Map<String, dynamic> _$PanelTrafficRecordToJson(_PanelTrafficRecord instance) =>
    <String, dynamic>{
      'u': instance.u,
      'd': instance.d,
      'record_at': instance.recordAt,
      'server_rate': instance.serverRate,
    };

_PanelInviteCode _$PanelInviteCodeFromJson(Map<String, dynamic> json) =>
    _PanelInviteCode(
      code: json['code'] as String?,
      createdAt: (json['created_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PanelInviteCodeToJson(_PanelInviteCode instance) =>
    <String, dynamic>{'code': instance.code, 'created_at': instance.createdAt};

_PanelInvite _$PanelInviteFromJson(Map<String, dynamic> json) => _PanelInvite(
  codes:
      (json['codes'] as List<dynamic>?)
          ?.map((e) => PanelInviteCode.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  stat:
      (json['stat'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
);

Map<String, dynamic> _$PanelInviteToJson(_PanelInvite instance) =>
    <String, dynamic>{'codes': instance.codes, 'stat': instance.stat};

_PanelUserInfo _$PanelUserInfoFromJson(Map<String, dynamic> json) =>
    _PanelUserInfo(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      transferEnable: (json['transfer_enable'] as num?)?.toInt(),
      u: (json['u'] as num?)?.toInt(),
      d: (json['d'] as num?)?.toInt(),
      expiredAt: (json['expired_at'] as num?)?.toInt(),
      deviceLimit: (json['device_limit'] as num?)?.toInt(),
      balance: (json['balance'] as num?)?.toInt(),
      commissionBalance: (json['commission_balance'] as num?)?.toInt(),
      plan: json['plan'] == null
          ? null
          : PanelPlan.fromJson(json['plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PanelUserInfoToJson(_PanelUserInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'transfer_enable': instance.transferEnable,
      'u': instance.u,
      'd': instance.d,
      'expired_at': instance.expiredAt,
      'device_limit': instance.deviceLimit,
      'balance': instance.balance,
      'commission_balance': instance.commissionBalance,
      'plan': instance.plan,
    };

_PanelSubscribeInfo _$PanelSubscribeInfoFromJson(Map<String, dynamic> json) =>
    _PanelSubscribeInfo(
      plan: json['plan'] == null
          ? null
          : PanelPlan.fromJson(json['plan'] as Map<String, dynamic>),
      subscribeUrl: json['subscribe_url'] as String?,
      expiredAt: (json['expired_at'] as num?)?.toInt(),
      u: (json['u'] as num?)?.toInt(),
      d: (json['d'] as num?)?.toInt(),
      transferEnable: (json['transfer_enable'] as num?)?.toInt(),
      resetDay: (json['reset_day'] as num?)?.toInt(),
      deviceLimit: (json['device_limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PanelSubscribeInfoToJson(_PanelSubscribeInfo instance) =>
    <String, dynamic>{
      'plan': instance.plan,
      'subscribe_url': instance.subscribeUrl,
      'expired_at': instance.expiredAt,
      'u': instance.u,
      'd': instance.d,
      'transfer_enable': instance.transferEnable,
      'reset_day': instance.resetDay,
      'device_limit': instance.deviceLimit,
    };

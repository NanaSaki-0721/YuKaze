import 'package:dio/dio.dart';
import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';

class PanelApiException implements Exception {
  final String message;

  const PanelApiException(this.message);

  @override
  String toString() => message;
}

class PanelLoginResult {
  final String? authData;
  final String? challenge;

  const PanelLoginResult({this.authData, this.challenge});
}

class PanelCheckoutResult {
  final Object? data;
  final int type;

  const PanelCheckoutResult({this.data, this.type = 0});
}

class PanelApi {
  Future<Object?> _post(String path, Map<String, Object?> data) async {
    try {
      final response = await panelRequest.dio.post<Object?>(path, data: data);
      return response.data is Map
          ? (response.data as Map)['data']
          : response.data;
    } on DioException catch (error) {
      throw PanelApiException(_extractMessage(error));
    }
  }

  Future<Object?> _get(String path) async {
    try {
      final response = await panelRequest.dio.get<Object?>(path);
      return response.data is Map
          ? (response.data as Map)['data']
          : response.data;
    } on DioException catch (error) {
      throw PanelApiException(_extractMessage(error));
    }
  }

  String _extractMessage(DioException error) {
    final data = error.response?.data;
    if (data is Map) {
      final message = data['message'];
      if (message is String && message.isNotEmpty) {
        return message;
      }
      final errors = data['errors'];
      if (errors is Map && errors.isNotEmpty) {
        final first = errors.values.first;
        if (first is List && first.isNotEmpty) {
          return first.first.toString();
        }
        return first.toString();
      }
    }
    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.connectionError =>
        currentAppLocalizations.unknownNetworkError,
      _ => currentAppLocalizations.networkException,
    };
  }

  String _parseAuthData(Object? data) {
    if (data is String && data.isNotEmpty) {
      return data;
    }
    if (data is Map) {
      final authData = data['auth_data'];
      if (authData is String && authData.isNotEmpty) {
        return authData;
      }
    }
    throw const PanelApiException('invalid auth response');
  }

  Future<PanelLoginResult> login(String email, String password) async {
    final data = await _post('/passport/auth/login', {
      'email': email,
      'password': password,
    });
    if (data is Map) {
      final challenge = data['challenge'];
      if (challenge is String && challenge.isNotEmpty) {
        return PanelLoginResult(challenge: challenge);
      }
    }
    return PanelLoginResult(authData: _parseAuthData(data));
  }

  Future<String> verify2fa(String challenge, String code) async {
    final data = await _post('/passport/auth/verify2fa', {
      'challenge': challenge,
      'code': code,
    });
    return _parseAuthData(data);
  }

  Future<void> sendEmailVerify(String email, {bool isForget = false}) async {
    await _post('/passport/comm/sendEmailVerify', {
      'email': email,
      'isforget': isForget ? 1 : 0,
    });
  }

  Future<String> register({
    required String email,
    required String password,
    required String emailCode,
    String? inviteCode,
  }) async {
    final data = await _post('/passport/auth/register', {
      'email': email,
      'password': password,
      'email_code': emailCode,
      if (inviteCode != null && inviteCode.isNotEmpty)
        'invite_code': inviteCode,
    });
    return _parseAuthData(data);
  }

  Future<bool> checkLogin() async {
    final data = await _get('/user/checkLogin');
    return data == true;
  }

  Future<PanelSiteConfig?> getSiteConfig() async {
    final data = await _get('/guest/comm/config');
    if (data is! Map) {
      return null;
    }
    return PanelSiteConfig.fromJson(Map<String, Object?>.from(data));
  }

  Future<PanelUserInfo?> getUserInfo() async {
    final data = await _get('/user/info');
    if (data is! Map) {
      return null;
    }
    return PanelUserInfo.fromJson(Map<String, Object?>.from(data));
  }

  Future<PanelSubscribeInfo?> getSubscribe() async {
    final data = await _get('/user/getSubscribe');
    if (data is! Map) {
      return null;
    }
    return PanelSubscribeInfo.fromJson(Map<String, Object?>.from(data));
  }

  Future<List<PanelOrder>> fetchOrders() async {
    final data = await _get('/user/order/fetch');
    if (data is! List) {
      return [];
    }
    return data
        .whereType<Map>()
        .map((item) => PanelOrder.fromJson(Map<String, Object?>.from(item)))
        .toList();
  }

  Future<List<PanelTicket>> fetchTickets() async {
    final data = await _get('/user/ticket/fetch');
    if (data is! List) {
      return [];
    }
    return data
        .whereType<Map>()
        .map((item) => PanelTicket.fromJson(Map<String, Object?>.from(item)))
        .toList();
  }

  Future<void> createTicket({
    required String subject,
    required int level,
    required String message,
  }) async {
    await _post('/user/ticket/save', {
      'subject': subject,
      'level': level,
      'message': message,
    });
  }

  Future<PanelTicketDetail?> fetchTicketDetail(int id) async {
    final data = await _get('/user/ticket/fetch?id=$id');
    if (data is! Map) {
      return null;
    }
    return PanelTicketDetail.fromJson(Map<String, Object?>.from(data));
  }

  Future<void> replyTicket({
    required int id,
    required String message,
  }) async {
    await _post('/user/ticket/reply', {
      'id': id,
      'message': message,
    });
  }

  Future<List<PanelTrafficRecord>> fetchTrafficLog() async {
    final data = await _get('/user/stat/getTrafficLog');
    if (data is! List) {
      return [];
    }
    return data
        .whereType<Map>()
        .map(
          (item) =>
              PanelTrafficRecord.fromJson(Map<String, Object?>.from(item)),
        )
        .toList();
  }

  Future<PanelInvite?> fetchInvite() async {
    final data = await _get('/user/invite/fetch');
    if (data is! Map) {
      return null;
    }
    return PanelInvite.fromJson(Map<String, Object?>.from(data));
  }

  Future<void> saveInvite() async {
    await _get('/user/invite/save');
  }

  Future<List<PanelPlan>> fetchPlans() async {
    final data = await _get('/user/plan/fetch');
    if (data is! List) {
      return [];
    }
    return data
        .whereType<Map>()
        .map((item) => PanelPlan.fromJson(Map<String, Object?>.from(item)))
        .toList();
  }

  Future<String> saveOrder({
    required int planId,
    required String period,
    String? couponCode,
  }) async {
    final data = await _post('/user/order/save', {
      'plan_id': planId,
      'period': period,
      if (couponCode != null && couponCode.isNotEmpty)
        'coupon_code': couponCode,
    });
    if (data is String && data.isNotEmpty) {
      return data;
    }
    if (data is Map) {
      final tradeNo = data['trade_no'];
      if (tradeNo is String && tradeNo.isNotEmpty) {
        return tradeNo;
      }
    }
    throw const PanelApiException('invalid order response');
  }

  Future<List<PanelPaymentMethod>> fetchPaymentMethods() async {
    final data = await _get('/user/order/getPaymentMethod');
    if (data is! List) {
      return [];
    }
    return data
        .whereType<Map>()
        .map(
          (item) =>
              PanelPaymentMethod.fromJson(Map<String, Object?>.from(item)),
        )
        .toList();
  }

  Future<PanelCheckoutResult> checkoutOrder({
    required String tradeNo,
    required String method,
  }) async {
    try {
      final response = await panelRequest.dio.post<Object?>(
        '/user/order/checkout',
        data: {'trade_no': tradeNo, 'method': method},
      );
      final map = response.data;
      if (map is Map) {
        var data = map['data'];
        final type = map['type'] is num ? (map['type'] as num).toInt() : 0;
        if (data is Map && type == 1) {
          data = data['checkout_url'] ?? data['url'] ?? data;
        }
        return PanelCheckoutResult(data: data, type: type);
      }
      throw const PanelApiException('invalid checkout response');
    } on DioException catch (error) {
      throw PanelApiException(_extractMessage(error));
    }
  }

  Future<Object?> checkOrderStatus(String tradeNo) async {
    return _get('/user/order/check?trade_no=$tradeNo');
  }

  Future<void> cancelOrder(String tradeNo) async {
    await _post('/user/order/cancel', {'trade_no': tradeNo});
  }
}

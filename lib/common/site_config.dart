class SiteConfig {
  static const String siteName = '';

  static const int brandPrimaryColor = 0xFFDD4584;

  static const bool middlewareEnabled = true;

  static const String apiPrefix = '/api/v1';

  static const String panelHost = '';

  static const String middlewareHost = 'https://games-mw.0721888.xyz';

  static const String middlewarePath = '/games/0721';

  static const String aesKey = '2c79b8a7800a7cc8';

  static const String globalUa = '';

  static const List<String> hiddenProxyNamePatterns = [
    '自动选择',
    '故障转移',
    '剩余流量',
    '套餐到期',
    '重置剩余',
  ];
}

bool shouldHideProxyName(String name) {
  return SiteConfig.hiddenProxyNamePatterns.any(
    (pattern) => RegExp(pattern).hasMatch(name),
  );
}

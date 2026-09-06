import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/state.dart';

class PanelRequest {
  late final Dio dio;

  PanelRequest() {
    const middlewareEnabled = SiteConfig.middlewareEnabled;
    dio = Dio(
      BaseOptions(
        baseUrl: middlewareEnabled
            ? SiteConfig.middlewareHost
            : SiteConfig.panelHost,
        headers: {'User-Agent': browserUa},
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.findProxy = FlClashHttpOverrides.handleFindProxy;
        client.badCertificateCallback = (_, _, _) => true;
        return client;
      },
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (middlewareEnabled) {
            final query = Transformer.urlEncodeQueryMap(
              options.queryParameters,
              options.listFormat,
            );
            final plaintext = query.isEmpty
                ? options.path
                : options.path.contains('?')
                ? '${options.path}&$query'
                : '${options.path}?$query';
            final iv = randomIvHex();
            final payload = encryptPathPayload(
              plaintext,
              SiteConfig.aesKey,
              iv,
            );
            options.path = '${SiteConfig.middlewarePath}/$payload';
            options.queryParameters.clear();
            options.headers['X-IV'] = iv;
          } else {
            options.path = '${SiteConfig.apiPrefix}${options.path}';
          }
          final authData = globalState.container
              .read(panelSessionProvider)
              .value;
          if (authData != null) {
            options.headers['Authorization'] = authData;
          }
          handler.next(options);
        },
      ),
    );
  }
}

final panelRequest = PanelRequest();

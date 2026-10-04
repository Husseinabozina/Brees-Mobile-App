import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'api_client.dart';
import 'api_exception.dart';

typedef AccessTokenProvider = Future<String?> Function();

class RealApiClient implements ApiClient {
  RealApiClient({
    required String baseUrl,
    this.accessTokenProvider,
    this.requestTimeout = const Duration(seconds: 20),
    Map<String, String> defaultHeaders = const <String, String>{},
    HttpClient? httpClient,
  })  : _baseUrl = _normalizeBaseUrl(baseUrl),
        _defaultHeaders = Map.unmodifiable(defaultHeaders),
        _httpClient = httpClient ?? HttpClient();

  final String _baseUrl;
  final AccessTokenProvider? accessTokenProvider;
  final Duration requestTimeout;
  final Map<String, String> _defaultHeaders;
  final HttpClient _httpClient;

  @override
  Future<JsonMap> get(String path) {
    return _send('GET', path);
  }

  @override
  Future<JsonMap> post(
    String path, {
    JsonMap body = const <String, dynamic>{},
  }) {
    return _send('POST', path, body: body);
  }

  void close({bool force = false}) {
    _httpClient.close(force: force);
  }

  Future<JsonMap> _send(
    String method,
    String path, {
    JsonMap? body,
  }) async {
    final uri = _resolve(path);

    try {
      final request = await _httpClient
          .openUrl(method, uri)
          .timeout(requestTimeout);

      request.headers
        ..set(HttpHeaders.acceptHeader, ContentType.json.mimeType)
        ..set(HttpHeaders.contentTypeHeader, ContentType.json.mimeType);

      for (final entry in _defaultHeaders.entries) {
        request.headers.set(entry.key, entry.value);
      }

      final token = await accessTokenProvider?.call();
      if (token != null && token.trim().isNotEmpty) {
        request.headers.set(
          HttpHeaders.authorizationHeader,
          'Bearer ${token.trim()}',
        );
      }

      if (body != null) {
        request.write(jsonEncode(body));
      }

      final response = await request.close().timeout(requestTimeout);
      final responseBody = await utf8
          .decoder
          .bind(response)
          .join()
          .timeout(requestTimeout);

      final payload = _decodeBody(responseBody);

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw ApiException(
          statusCode: response.statusCode,
          message: _extractErrorMessage(payload, response.reasonPhrase),
        );
      }

      return payload;
    } on ApiException {
      rethrow;
    } on TimeoutException {
      throw const ApiException(
        statusCode: 0,
        message: 'Request timed out.',
      );
    } on SocketException {
      throw const ApiException(
        statusCode: 0,
        message: 'Unable to reach the server.',
      );
    } on FormatException {
      throw const ApiException(
        statusCode: 0,
        message: 'Server returned invalid JSON.',
      );
    }
  }

  Uri _resolve(String path) {
    final cleanPath = path.trim();
    if (cleanPath.isEmpty) {
      throw const ApiException(
        statusCode: 0,
        message: 'API path cannot be empty.',
      );
    }

    final normalizedPath =
        cleanPath.startsWith('/') ? cleanPath.substring(1) : cleanPath;
    return Uri.parse('$_baseUrl/$normalizedPath');
  }

  static JsonMap _decodeBody(String body) {
    if (body.trim().isEmpty) {
      return <String, dynamic>{};
    }

    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Expected a JSON object response.');
    }
    return decoded;
  }

  static String _extractErrorMessage(
    JsonMap payload,
    String? reasonPhrase,
  ) {
    final message = payload['message'];
    if (message is String && message.trim().isNotEmpty) {
      return message.trim();
    }

    final error = payload['error'];
    if (error is String && error.trim().isNotEmpty) {
      return error.trim();
    }

    return reasonPhrase?.trim().isNotEmpty == true
        ? reasonPhrase!.trim()
        : 'Request failed.';
  }

  static String _normalizeBaseUrl(String value) {
    final trimmed = value.trim();
    final uri = Uri.tryParse(trimmed);

    if (trimmed.isEmpty ||
        uri == null ||
        !uri.hasScheme ||
        uri.host.isEmpty ||
        (uri.scheme != 'http' && uri.scheme != 'https')) {
      throw ArgumentError.value(
        value,
        'baseUrl',
        'Expected an absolute http/https URL.',
      );
    }

    return trimmed.endsWith('/')
        ? trimmed.substring(0, trimmed.length - 1)
        : trimmed;
  }
}

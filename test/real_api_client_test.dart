import 'dart:convert';
import 'dart:io';

import 'package:brees_mobile_app/src/core/network/api_exception.dart';
import 'package:brees_mobile_app/src/core/network/real_api_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('real API client sends JSON and bearer auth and parses responses', () async {
    late HttpServer server;
    late RealApiClient client;

    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() async {
      client.close(force: true);
      await server.close(force: true);
    });

    server.listen((request) async {
      if (request.uri.path == '/v1/echo' && request.method == 'POST') {
        final rawBody = await utf8.decoder.bind(request).join();
        final decoded = jsonDecode(rawBody) as Map<String, dynamic>;

        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType.json
          ..write(
            jsonEncode(
              <String, dynamic>{
                'data': <String, dynamic>{
                  'name': decoded['name'],
                  'authorization':
                      request.headers.value(HttpHeaders.authorizationHeader),
                },
              },
            ),
          );
        await request.response.close();
        return;
      }

      request.response
        ..statusCode = HttpStatus.notFound
        ..headers.contentType = ContentType.json
        ..write(jsonEncode(<String, dynamic>{'message': 'Not found'}));
      await request.response.close();
    });

    client = RealApiClient(
      baseUrl: 'http://127.0.0.1:${server.port}',
      accessTokenProvider: () async => 'demo-token',
      requestTimeout: const Duration(seconds: 2),
    );

    final response = await client.post(
      '/v1/echo',
      body: const <String, dynamic>{'name': 'Brees'},
    );

    final data = response['data'] as Map<String, dynamic>;
    expect(data['name'], 'Brees');
    expect(data['authorization'], 'Bearer demo-token');
  });

  test('real API client maps non-2xx JSON responses to ApiException', () async {
    late HttpServer server;
    late RealApiClient client;

    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() async {
      client.close(force: true);
      await server.close(force: true);
    });

    server.listen((request) async {
      request.response
        ..statusCode = HttpStatus.unprocessableEntity
        ..headers.contentType = ContentType.json
        ..write(
          jsonEncode(
            <String, dynamic>{'message': 'Email is already registered.'},
          ),
        );
      await request.response.close();
    });

    client = RealApiClient(
      baseUrl: 'http://127.0.0.1:${server.port}',
      requestTimeout: const Duration(seconds: 2),
    );

    expect(
      () => client.post(
        '/v1/auth/register',
        body: const <String, dynamic>{
          'name': 'Louis Real',
          'email': 'louis@example.com',
          'password': 'portfolio123',
        },
      ),
      throwsA(
        isA<ApiException>()
            .having((error) => error.statusCode, 'statusCode', 422)
            .having(
              (error) => error.message,
              'message',
              'Email is already registered.',
            ),
      ),
    );
  });

  test('real API client validates the base URL', () {
    expect(
      () => RealApiClient(baseUrl: 'not-a-url'),
      throwsArgumentError,
    );
  });
}

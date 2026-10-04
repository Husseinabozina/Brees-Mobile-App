import 'package:brees_mobile_app/src/app/dependencies/brees_dependencies.dart';
import 'package:brees_mobile_app/src/core/network/api_exception.dart';
import 'package:brees_mobile_app/src/core/network/mock_api_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('mock auth endpoint validates and accepts registration payload', () async {
    final client = MockApiClient(latency: Duration.zero);

    final response = await client.post(
      '/v1/auth/register',
      body: const <String, dynamic>{
        'name': 'Louis Real',
        'email': 'louis@example.com',
        'password': 'portfolio123',
      },
    );

    expect(response['data'], isA<Map<String, dynamic>>());
    expect(
      (response['data'] as Map<String, dynamic>)['id'],
      'demo-user-001',
    );

    expect(
      client.post(
        '/v1/auth/register',
        body: const <String, dynamic>{
          'name': '',
          'email': 'not-an-email',
          'password': '123',
        },
      ),
      throwsA(isA<ApiException>()),
    );
  });

  test('mock backend maps transport finance JSON into domain entities', () async {
    final dependencies = BreesDependencies.mock(latency: Duration.zero);

    final snapshot = await dependencies.financeRepository.loadSnapshot();

    expect(snapshot.availableBalanceLabel, 'N20,983');
    expect(snapshot.accounts, hasLength(4));
    expect(snapshot.accounts.first.name, 'Kuda bank');
    expect(snapshot.accounts.first.accountNumber, '1234567890');
    expect(snapshot.transactions, isNotEmpty);
    expect(snapshot.transactions.first.isIncome, isTrue);
  });
}

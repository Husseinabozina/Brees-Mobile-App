import 'api_client.dart';
import 'api_exception.dart';

class MockApiClient implements ApiClient {
  MockApiClient({
    this.latency = const Duration(milliseconds: 120),
  });

  final Duration latency;

  @override
  Future<JsonMap> get(String path) async {
    await Future<void>.delayed(latency);

    return switch (path) {
      '/v1/finance/snapshot' => _financeSnapshot,
      _ => throw const ApiException(
          statusCode: 404,
          message: 'Mock endpoint not found.',
        ),
    };
  }

  @override
  Future<JsonMap> post(
    String path, {
    JsonMap body = const <String, dynamic>{},
  }) async {
    await Future<void>.delayed(latency);

    return switch (path) {
      '/v1/auth/register' => _register(body),
      _ => throw const ApiException(
          statusCode: 404,
          message: 'Mock endpoint not found.',
        ),
    };
  }

  JsonMap _register(JsonMap body) {
    final name = body['name'];
    final email = body['email'];
    final password = body['password'];

    if (name is! String ||
        name.trim().isEmpty ||
        email is! String ||
        !email.contains('@') ||
        password is! String ||
        password.length < 8) {
      throw const ApiException(
        statusCode: 422,
        message: 'Invalid registration payload.',
      );
    }

    return <String, dynamic>{
      'data': <String, dynamic>{
        'id': 'demo-user-001',
        'name': name,
        'email': email,
        'emailVerified': false,
      },
    };
  }

  static final JsonMap _financeSnapshot = <String, dynamic>{
    'data': <String, dynamic>{
      'availableBalanceLabel': 'N20,983',
      'budgetLabel': 'N29,880',
      'accounts': <JsonMap>[
        <String, dynamic>{
          'name': 'Kuda bank',
          'balanceLabel': 'N12,000.00',
          'assetPath': 'assets/images/bank_kuda.png',
          'accountNumber': '1234567890',
          'type': 'Savings',
        },
        <String, dynamic>{
          'name': 'GT Bank',
          'balanceLabel': 'N1,050.00',
          'assetPath': 'assets/images/bank_gt.png',
        },
        <String, dynamic>{
          'name': 'PiggyVest',
          'balanceLabel': 'N6,083.00',
          'assetPath': 'assets/images/bank_piggy.png',
        },
        <String, dynamic>{
          'name': 'UBA',
          'balanceLabel': 'N950',
          'assetPath': 'assets/images/bank_uba.png',
        },
      ],
      'transactions': <JsonMap>[
        <String, dynamic>{
          'title': 'John Ogaga',
          'subtitle': 'Zenith Bank 12:03 AM',
          'amountLabel': '+N20,983',
          'initial': 'J',
          'isIncome': true,
        },
        <String, dynamic>{
          'title': 'The Place Restaurant',
          'subtitle': 'GT-Bank 12:03 AM',
          'amountLabel': '-N983',
          'initial': 'T',
          'isIncome': false,
        },
        <String, dynamic>{
          'title': 'Transfer to Philip',
          'subtitle': 'GT-Bank 12:03 AM',
          'amountLabel': '-N298',
          'initial': 'P',
          'isIncome': false,
        },
        <String, dynamic>{
          'title': 'Habib Yogurt',
          'subtitle': 'GT-Bank 12:03 AM',
          'amountLabel': '-N4,115',
          'initial': 'H',
          'isIncome': false,
        },
      ],
    },
  };
}

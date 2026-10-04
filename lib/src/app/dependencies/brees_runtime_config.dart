import '../../core/network/real_api_client.dart';
import 'brees_dependencies.dart';

abstract final class BreesRuntimeConfig {
  static const String apiBaseUrl = String.fromEnvironment(
    'BREES_API_BASE_URL',
  );

  static bool get usesRealBackend => apiBaseUrl.trim().isNotEmpty;

  static BreesDependencies buildDependencies() {
    if (!usesRealBackend) {
      return BreesDependencies.mock();
    }

    return BreesDependencies.fromApiClient(
      RealApiClient(baseUrl: apiBaseUrl),
    );
  }
}

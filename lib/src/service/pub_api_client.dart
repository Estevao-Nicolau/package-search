import 'package:pub_api_client/pub_api_client.dart';

class PubApiClient {
  final client = PubClient();

  Future<List<PackageResult>> getSearchPackges(String name) async {
    final results = await client.search(name);
    return results.packages;
  }

  Future<PackageScore> packageScore(String package) async {
    final score = await client.packageScore(package);
    return score;
  }
}

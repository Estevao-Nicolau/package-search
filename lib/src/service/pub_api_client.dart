import 'package:pub_api_client/pub_api_client.dart';

class PubApiClient {
  final client = PubClient();

  Future<void> searchPackages() async {
  final client = PubClient();
  final searchResult = await client.search('dio');
  final packages = searchResult.packages;
  
}

Future<void> _updateSuggestions(String query) async {
  final pubClient = PubClient();
  final packages = await pubClient.search(query);

  // setState(() {
  //   _suggestions = packages.map((p) => p.name).toList();
  // });
}


  getPackageInfo() async {
    final packageInfo = await client.packageInfo('http');
  }

  getPackageScore() async {
    final score = await client.packageScore('http');
  }

}
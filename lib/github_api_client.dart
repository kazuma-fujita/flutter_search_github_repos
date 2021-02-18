import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class GithubApiClient {
  // factory コンストラクタは instanceを生成せず常にキャッシュを返す(singleton)
  factory GithubApiClient({String baseUrl = 'https://api.github.com'}) {
    return _instance ??= GithubApiClient._internal(baseUrl);
  }
  // クラス生成時に instance を生成する class コンストラクタ
  GithubApiClient._internal(this.baseUrl);
  // singleton にする為の instance キャッシュ
  static GithubApiClient _instance;
  // GithubAPIの基底Url
  final String baseUrl;

  Future<String> get(String endpoint) async {
    final url = '$baseUrl$endpoint';
    try {
      final response = await http.get(url);
      return _parseResponse(response.statusCode, response.body);
    } on SocketException {
      throw Exception('No Internet connection');
    }
  }

  String _parseResponse(int httpStatus, String responseBody) {
    switch (httpStatus) {
      case 200:
        return responseBody;
        break;
      default:
        final decodedJson = json.decode(responseBody) as Map<String, dynamic>;
        throw Exception('$httpStatus ${decodedJson['message']}');
        break;
    }
  }
}

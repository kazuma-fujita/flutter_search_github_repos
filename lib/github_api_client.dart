import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class GithubApiClient {
  // factory コンストラクタは instanceを生成せず常にキャッシュを返す(singleton)
  factory GithubApiClient() => _instance;
  // クラス生成時に instance を生成する class コンストラクタ
  GithubApiClient._internal();
  // singleton にする為の instance キャッシュ
  static final GithubApiClient _instance = GithubApiClient._internal();
  // GithubAPIの基底Url
  static const baseUrl = 'https://api.github.com';

  Future<String> get(String query) async {
    final url = '$baseUrl$query';
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
      case 422:
        // [q=]の検索キーワードが空文字の場合HttpStatus422 Validation Failedエラーが発生
        final decodedJson = json.decode(responseBody) as Map<String, dynamic>;
        throw Exception(decodedJson['message']);
        break;
      default:
        throw Exception('$httpStatus Unknown Error');
        break;
    }
  }
}

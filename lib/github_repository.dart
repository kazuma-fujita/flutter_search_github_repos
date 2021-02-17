import 'dart:convert';
import 'dart:io';
import 'package:flutter_search_github_repos/repository_entity.dart';
import 'package:http/http.dart' as http;

class GithubRepository {
  Future<List<RepositoryEntity>> searchRepositories(
      String searchKeyword) async {
    final url =
        'https://api.github.com/search/repositories?q=$searchKeyword&sort=stars&order=desc';
    try {
      final response = await http.get(url);
      return _parseResponse(response.statusCode, response.body);
    } on SocketException {
      throw Exception('No Internet connection');
    }
  }

  List<RepositoryEntity> _parseResponse(int httpStatus, String responseBody) {
    switch (httpStatus) {
      case 200:
        final decodedJson = json.decode(responseBody) as Map<String, dynamic>;
        final repositoryList = <RepositoryEntity>[];
        if (decodedJson['total_count'] as int == 0) {
          return repositoryList;
        }
        for (final itemJson in decodedJson['items']) {
          repositoryList
              .add(RepositoryEntity.fromJson(itemJson as Map<String, dynamic>));
        }
        return repositoryList;
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

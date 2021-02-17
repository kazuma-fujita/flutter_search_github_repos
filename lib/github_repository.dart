import 'dart:convert';
import 'package:flutter_search_github_repos/repository_entity.dart';
import 'package:http/http.dart' as http;

class GithubRepository {
  Future<List<RepositoryEntity>> searchRepositories(
      String searchKeyword) async {
    final url =
        'https://api.github.com/search/repositories?q=$searchKeyword&sort=stars&order=desc';
    final response = await http.get(url);

    switch (response.statusCode) {
      case 200:
        final decodedJson = json.decode(response.body) as Map<String, dynamic>;
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
      default:
        final decodedJson = json.decode(response.body) as Map<String, dynamic>;
        throw Exception(decodedJson['message']);
        break;
    }
  }
}

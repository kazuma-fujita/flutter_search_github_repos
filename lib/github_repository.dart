import 'dart:convert';
import 'package:flutter_search_github_repos/repository_entity.dart';
import 'package:http/http.dart' as http;

class GithubRepository {
  Future<List<RepositoryEntity>> searchRepositories(
      String searchKeyword) async {
    final url =
        'https://api.github.com/search/repositories?q=$searchKeyword&sort=stars&order=desc';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final list = <RepositoryEntity>[];
      final decodedJson = json.decode(response.body) as Map<String, dynamic>;
      for (final itemJson in decodedJson['items']) {
        list.add(RepositoryEntity.fromJson(itemJson as Map<String, dynamic>));
      }
      list.forEach(print);
      return list;
    } else {
      throw Exception('Fail to search repository.');
    }
  }
}

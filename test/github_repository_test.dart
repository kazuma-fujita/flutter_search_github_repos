import 'package:flutter_search_github_repos/github_api_client.dart';
import 'package:flutter_search_github_repos/github_repository.dart';
import 'package:flutter_search_github_repos/repository_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'fixture.dart';

class MockGithubApiClient extends Mock implements GithubApiClient {}

void main() {
  GithubRepository _githubRepository;
  GithubApiClient _apiClient;

  setUp(() async {
    _apiClient = MockGithubApiClient();
    _githubRepository = GithubRepositoryImpl(_apiClient);
  });

  group('Github repository testing', () {
    test('Test of result with one element of array.', () async {
      final mockResponse = fixture('http_status_200.json');
      when(_apiClient.get(any)).thenAnswer((_) async => mockResponse);
      final repositoryList = await _githubRepository.searchRepositories('test');

      verify(_apiClient.get(any)).called(1);
      expect(
        repositoryList,
        isA<List<RepositoryEntity>>()
            .having((list) => list, 'isNotNull', isNotNull)
            .having((list) => list.length, 'length', 1)
            .having((list) => list[0].id, 'id', 330997542)
            .having((list) => list[0].fullName, 'fullName',
                'Jasyyie/sympli.search.api')
            .having((list) => list[0].stargazersCount, 'stargazersCount', 10)
            .having((list) => list[0].owner.avatarUrl, 'avatarUrl',
                'https://avatars.githubusercontent.com/u/49047008?v=4'),
      );
    });
  });
}

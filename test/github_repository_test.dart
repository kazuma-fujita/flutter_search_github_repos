import 'package:flutter_search_github_repos/github_api_client.dart';
import 'package:flutter_search_github_repos/github_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'fixture.dart';

class MockGithubApiClient extends Mock implements GithubApiClient {}

void main() {
  GithubRepository _githubRepository;
  MockGithubApiClient _apiClient;

  setUp(() async {
    _apiClient = MockGithubApiClient();
    _githubRepository = GithubRepository(_apiClient);
  });

  group('Github repository testing', () {
    test('Test of result with one element of array.', () async {
      final mockResponse = fixture('http_status_200.json');
      when(_apiClient.get(any)).thenAnswer((_) async => mockResponse);
      final repositoryList = await _githubRepository.searchRepositories('test');

      verify(_apiClient.get(any)).called(1);
      expect(repositoryList, isNotNull);
      expect(repositoryList.length, 1);
      final repository = repositoryList[0];
      expect(repository.id, 330997542);
      expect(repository.fullName, 'Jasyyie/sympli.search.api');
      expect(repository.stargazersCount, 10);
      expect(repository.owner.avatarUrl,
          'https://avatars.githubusercontent.com/u/49047008?v=4');
    });
  });
}

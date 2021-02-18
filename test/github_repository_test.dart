import 'package:flutter_search_github_repos/github_api_client.dart';
import 'package:flutter_search_github_repos/github_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'fixture.dart';

class GithubApiClientMock extends Mock implements GithubApiClient {}

void main() {
  GithubRepository _githubRepository;
  GithubApiClientMock _apiClient;

  setUp(() async {
    _apiClient = GithubApiClientMock();
    _githubRepository = GithubRepository(_apiClient);
  });

  group('Search Github repository testing', () {
    test('Test of result with one element of array.', () async {
      final responseMock = fixture('http_status_200.json');
      when(_apiClient.get(any)).thenAnswer((_) => Future.value(responseMock));
      final repositoryList = await _githubRepository.searchRepositories('test');

      verify(_apiClient.get(any)).called(1);
      expect(repositoryList, isNotNull);
      expect(repositoryList.length, 1);
      final repository = repositoryList[0];
      expect(repository.id, 330997542);
      expect(repository.fullName, 'Jasyyie/sympli.search.api');
      expect(repository.stargazersCount, 0);
      expect(repository.owner.avatarUrl,
          'https://avatars.githubusercontent.com/u/49047008?v=4');
    });
  });
}

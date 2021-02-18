import 'package:flutter_search_github_repos/github_repository.dart';
import 'package:flutter_search_github_repos/repository_entity.dart';
import 'package:flutter_search_github_repos/repository_list_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGithubRepository extends Mock implements GithubRepository {}

void main() {
  MockGithubRepository _githubRepository;
  RepositoryListViewModel _viewModel;

  setUp(() async {
    _githubRepository = MockGithubRepository();
    _viewModel = RepositoryListViewModel(_githubRepository);
  });

  group('Repository list view model testing', () {
    test('Test that the search keyword is an empty string', () async {
      await _viewModel.searchRepositories('');
      final repositoryList = _viewModel.debugState.data.value;
      // ViewModelのコンストラクタでsearchRepositoriesが1回callされる
      verify(_githubRepository.searchRepositories(any)).called(1);
      expect(repositoryList, isNull);
    });

    test('Test of result with one element of array.', () async {
      final mockData = [
        const RepositoryEntity(
          id: 330997542,
          fullName: 'Jasyyie/sympli.search.api',
          stargazersCount: 10,
          watchersCount: 0,
          forksCount: 0,
          htmlUrl: '',
          owner: RepositoryOwnerEntity(
            avatarUrl: 'https://avatars.githubusercontent.com/u/49047008?v=4',
          ),
        )
      ];
      // githubRepositoryの戻り値をmocking
      when(_githubRepository.searchRepositories(any))
          .thenAnswer((_) async => mockData);
      // test対象メソッド実行
      await _viewModel.searchRepositories('test');
      // test対象オブジェクト取得
      final repositoryList = _viewModel.debugState.data.value;
      // ViewModelのコンストラクタでsearchRepositoriesが呼ばれているので合計2回callされる
      verify(_githubRepository.searchRepositories(any)).called(2);
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

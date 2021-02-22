import 'package:flutter_search_github_repos/github_repository.dart';
import 'package:flutter_search_github_repos/repository_entity.dart';
import 'package:flutter_search_github_repos/repository_list_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

    test('Test of result with exception error.', () async {
      // githubRepositoryの戻り値をmocking
      when(_githubRepository.searchRepositories(any))
          .thenAnswer((_) async => throw Exception('error'));
      // test対象メソッド実行
      await _viewModel.searchRepositories('test');
      // ViewModelのコンストラクタでsearchRepositoriesが呼ばれているので合計2回callされる
      verify(_githubRepository.searchRepositories(any)).called(2);
      expect(
          _viewModel.debugState.toString(),
          AsyncValue<List<RepositoryEntity>>.error(Exception('error'))
              .toString());
    });
  });
}

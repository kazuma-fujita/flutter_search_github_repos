import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_search_github_repos/github_repository.dart';
import 'package:flutter_search_github_repos/main.dart';
import 'package:flutter_search_github_repos/repository_entity.dart';
import 'package:flutter_search_github_repos/repository_list_view.dart';
import 'package:flutter_search_github_repos/repository_list_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

class MockGithubRepository extends Mock implements GithubRepository {}

void main() {
  MockGithubRepository _githubRepository;
  ProviderScope _providerScope;

  // Widget testはHTTP 通信が 400 - Bad Request になる仕様
  // Image.network() で画像の取得が失敗する為、400 errorになる仕組みを無効化
  setUpAll(() => HttpOverrides.global = null);

  setUp(() async {
    _githubRepository = MockGithubRepository();
    // RepositoryListView初期表示データ
    final initialData = [
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
        .thenAnswer((_) async => initialData);

    _providerScope = ProviderScope(
      overrides: [
        // Providerで保持しているVieModelオブジェクトを上書き
        repositoryListViewModelProvider.overrideWithValue(
          RepositoryListViewModel(_githubRepository),
        ),
      ],
      // Providerを使用するWidgetをProviderScopeで囲む
      child: RepositoryListView(),
    );
  });

  group('Repository list view testing', () {
    testWidgets('Test to check the initial display of the list.',
        (WidgetTester tester) async {
      await tester.pumpWidget(_providerScope);

      expect(find.byType(CircularProgressIndicator), findsNothing);

      // ViewModelのコンストラクタでsearchRepositoriesが1回callされる
      verify(_githubRepository.searchRepositories(any)).called(1);
      // Finds noting
      expect(find.text('Repositoryが見つかりませんでした'), findsNothing);
      // Finds one widget
      expect(find.text('Github Repositories'), findsOneWidget);
      expect(find.text('検索キーワードを入力してください'), findsOneWidget);
      expect(find.text('Jasyyie/sympli.search.api'), findsOneWidget);
      expect(find.text('★10'), findsOneWidget);
    });

    testWidgets('Test that repository is not found in search keyword.',
        (WidgetTester tester) async {
      await tester.pumpWidget(_providerScope);
      // githubRepositoryの空配列の戻り値をmocking
      when(_githubRepository.searchRepositories(any))
          .thenAnswer((_) async => []);
      await tester.enterText(find.byType(TextField), 'Not found keyword');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsNothing);

      // ViewModelのコンストラクタと検索でsearchRepositoriesが2回callされる
      verify(_githubRepository.searchRepositories(any)).called(2);
      // Finds noting
      expect(find.text('Github Repositories'), findsOneWidget);
      expect(find.text('Not found keyword'), findsOneWidget);
      expect(find.text('Repositoryが見つかりませんでした'), findsOneWidget);
    });

    testWidgets('Test to find 2 items with search keyword.',
        (WidgetTester tester) async {
      await tester.pumpWidget(_providerScope);

      final mockData = [
        const RepositoryEntity(
          id: 31792824,
          fullName: 'flutter/flutter',
          stargazersCount: 113515,
          watchersCount: 0,
          forksCount: 0,
          htmlUrl: '',
          owner: RepositoryOwnerEntity(
            avatarUrl: 'https://avatars.githubusercontent.com/u/14101776?v=4',
          ),
        ),
        const RepositoryEntity(
          id: 330997542,
          fullName: 'Solido/awesome-flutter',
          stargazersCount: 33855,
          watchersCount: 0,
          forksCount: 0,
          htmlUrl: '',
          owner: RepositoryOwnerEntity(
            avatarUrl: 'https://avatars.githubusercontent.com/u/1295961?v=4',
          ),
        )
      ];

      // githubRepositoryの空配列の戻り値をmocking
      when(_githubRepository.searchRepositories(any))
          .thenAnswer((_) async => mockData);
      await tester.enterText(find.byType(TextField), 'Find 2 items keyword');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsNothing);

      // ViewModelのコンストラクタと検索でsearchRepositoriesが2回callされる
      verify(_githubRepository.searchRepositories(any)).called(2);
      // Finds nothing
      expect(find.text('Repositoryが見つかりませんでした'), findsNothing);
      // Finds one widget
      expect(find.text('Github Repositories'), findsOneWidget);
      expect(find.text('Find 2 items keyword'), findsOneWidget);
      expect(find.text('flutter/flutter'), findsOneWidget);
      expect(find.text('★113515'), findsOneWidget);
      expect(find.text('Solido/awesome-flutter'), findsOneWidget);
      expect(find.text('★33855'), findsOneWidget);
    });
  });

  // group('Repository list view error testing', () {
  //   testWidgets('', (WidgetTester tester) async {
  //     await tester.pumpWidget(_providerScope);
  //
  //     when(_githubRepository.searchRepositories(any))
  //         .thenAnswer((_) async => throw Exception('error'));
  //
  //     await tester.enterText(find.byType(TextField), 'Show error');
  //     await tester.testTextInput.receiveAction(TextInputAction.done);
  //
  //     await tester.pump();
  //
  //     verify(_githubRepository.searchRepositories(any)).called(2);
  //     // Finds noting
  //     expect(find.byType(CircularProgressIndicator), findsNothing);
  //     expect(find.text('Repositoryが見つかりませんでした'), findsNothing);
  //     // Finds one widget
  //     expect(find.text('Github Repositories'), findsOneWidget);
  //     expect(find.text('検索キーワードを入力してください'), findsOneWidget);
  //     expect(find.text('Show error'), findsOneWidget);
  //     // debugDumpRenderTree();
  //     // expect(find.text('error'), findsOneWidget);
  //     // Verify that platform version is retrieved.
  //     expect(
  //       find.byWidgetPredicate(
  //         (Widget widget) => widget is Text && widget.data == 'error',
  //       ),
  //       findsOneWidget,
  //     );
  //   });
  // });
}

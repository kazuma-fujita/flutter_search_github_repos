import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_search_github_repos/github_api_client.dart';
import 'package:flutter_search_github_repos/github_repository.dart';
import 'package:flutter_search_github_repos/repository_list_view.dart';
import 'package:flutter_search_github_repos/repository_list_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiClientProvider = Provider.autoDispose(
  (_) => GithubApiClientImpl(),
);

final githubRepositoryProvider = Provider.autoDispose(
  (ref) => GithubRepositoryImpl(ref.read(apiClientProvider)),
);

final repositoryListViewModelProvider = StateNotifierProvider.autoDispose(
  (ref) => RepositoryListViewModel(ref.read(githubRepositoryProvider)),
);

void main() {
  debugPaintSizeEnabled = false;
  runApp(
    ProviderScope(
      child: RepositoryListView(),
    ),
  );
}

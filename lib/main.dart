import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_search_github_repos/github_repository.dart';
import 'package:flutter_search_github_repos/repository_list_view.dart';
import 'package:flutter_search_github_repos/repository_list_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final githubRepositoryProvider = Provider.autoDispose(
  (ref) => GithubRepository(),
);

final repositoryListViewModelProvider = StateNotifierProvider.autoDispose(
  (ref) => RepositoryListViewModel(
    githubRepository: ref.read(githubRepositoryProvider),
  ),
);

void main() {
  debugPaintSizeEnabled = false;
  runApp(
    ProviderScope(
      child: RepositoryListView(),
    ),
  );
}

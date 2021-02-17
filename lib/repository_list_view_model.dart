import 'package:flutter/material.dart';
import 'package:flutter_search_github_repos/github_repository.dart';
import 'package:flutter_search_github_repos/repository_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepositoryListViewModel
    extends StateNotifier<AsyncValue<List<RepositoryEntity>>> {
  RepositoryListViewModel({
    @required this.githubRepository,
  }) : super(const AsyncValue.loading()) {
    searchRepositories('flutter');
  }

  final GithubRepository githubRepository;

  Future<void> searchRepositories(String searchKeyword) async {
    state = const AsyncValue.loading();
    state = await githubRepository
        .searchRepositories(searchKeyword)
        .then((value) => AsyncValue.data(value))
        .catchError((dynamic error) => AsyncValue<dynamic>.error(error));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_search_github_repos/github_repository.dart';
import 'package:flutter_search_github_repos/repository_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepositoryListViewModel
    extends StateNotifier<AsyncValue<List<RepositoryEntity>>> {
  RepositoryListViewModel(this.githubRepository)
      : super(const AsyncValue.loading()) {
    searchRepositories('flutter');
  }

  final GithubRepository githubRepository;

  Future<void> searchRepositories(String searchKeyword) async {
    if (searchKeyword.isEmpty) {
      return;
    }

    state = const AsyncValue.loading();
    try {
      final repositoryList =
          await githubRepository.searchRepositories(searchKeyword);
      state = AsyncValue.data(repositoryList);
    } on Exception catch (error) {
      state = AsyncValue.error(error);
    }
  }
}

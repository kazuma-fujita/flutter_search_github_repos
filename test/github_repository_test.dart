import 'package:flutter_search_github_repos/github_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final githubRepository = GithubRepository();
  group('API communication testing', () {
    test('test1', () {
      // awit githubRepository.searchRepositories('dummy');
    });
  });
  group('API communication error testing', () {
    test('error', () {
      githubRepository.searchRepositories('dummy');
    });
  });
}

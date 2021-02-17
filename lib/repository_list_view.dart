import 'package:flutter/material.dart';
import 'package:flutter_search_github_repos/main.dart';
import 'package:flutter_search_github_repos/repository_entity.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepositoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: RepositoryList(),
    );
  }
}

class RepositoryList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Repositories'),
      ),
      body: _textFieldView(),
    );
  }

  Widget _textFieldView() {
    final context = useContext();
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 16, right: 16, bottom: 0, left: 16),
          child: TextField(
            // controller: searchTextField,
            decoration: const InputDecoration(hintText: '検索キーワードを入力してください'),
            autofocus: true,
            onSubmitted: (searchKeyword) => _submission(searchKeyword, context),
          ),
        ),
        Expanded(
          child: _buildList(),
        ),
      ],
    );
  }

  void _submission(String searchKeyword, BuildContext context) {
    context
        .read(repositoryListViewModelProvider)
        .searchRepositories(searchKeyword);
  }

  Widget _buildList() {
    final repositoryListState =
        useProvider(repositoryListViewModelProvider.state);

    return repositoryListState.when(
      data: (repositoryList) => repositoryList.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: repositoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return _repositoryTile(repositoryList[index]);
              },
            )
          : _emptyListView(),
      loading: _loadingView,
      error: (error, _) => _errorView(error.toString()),
    );
  }

  Widget _loadingView() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _errorView(String errorMessage) {
    Fluttertoast.showToast(
      msg: errorMessage,
      backgroundColor: Colors.grey,
    );
    return Container();
  }

  Widget _emptyListView() {
    return const Center(
      child: Text(
        'Repositoryが見つかりませんでした',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _repositoryTile(RepositoryEntity repository) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      child: ListTile(
        leading: Image.network(repository.owner.avatarUrl),
        title: Text(
          repository.fullName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          '★${repository.stargazersCount.toString()}',
          maxLines: 1,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

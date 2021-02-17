import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_entity.g.dart';
part 'repository_entity.freezed.dart';

@freezed
abstract class RepositoryEntity with _$RepositoryEntity {
  const factory RepositoryEntity({
    @required final int id,
    @required @JsonKey(name: 'full_name') final String fullName,
    final String description,
    final String language,
    @required @JsonKey(name: 'html_url') final String htmlUrl,
    @required @JsonKey(name: 'stargazers_count') final int stargazersCount,
    @required @JsonKey(name: 'watchers_count') final int watchersCount,
    @required @JsonKey(name: 'forks_count') final int forksCount,
    @required final RepositoryOwnerEntity owner,
  }) = _RepositoryEntity;

  factory RepositoryEntity.fromJson(Map<String, dynamic> json) =>
      _$RepositoryEntityFromJson(json);
}

@freezed
abstract class RepositoryOwnerEntity with _$RepositoryOwnerEntity {
  const factory RepositoryOwnerEntity({
    @required @JsonKey(name: 'avatar_url') final String avatarUrl,
  }) = _RepositoryOwnerEntity;

  factory RepositoryOwnerEntity.fromJson(Map<String, dynamic> json) =>
      _$RepositoryOwnerEntityFromJson(json);
}

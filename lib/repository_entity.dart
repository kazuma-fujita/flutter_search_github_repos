import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_entity.g.dart';
part 'repository_entity.freezed.dart';

@freezed
abstract class RepositoryEntity with _$RepositoryEntity {
  const factory RepositoryEntity({
    @required final int id,
    @required final String fullName,
    final String description,
    final String language,
    @required final String htmlUrl,
    @required final int stargazersCount,
    @required final int watchersCount,
    @required final int forksCount,
    @required final RepositoryOwnerEntity owner,
  }) = _RepositoryEntity;

  factory RepositoryEntity.fromJson(Map<String, dynamic> json) =>
      _$RepositoryEntityFromJson(json);
}

@freezed
abstract class RepositoryOwnerEntity with _$RepositoryOwnerEntity {
  const factory RepositoryOwnerEntity({
    @required final String avatarUrl,
  }) = _RepositoryOwnerEntity;

  factory RepositoryOwnerEntity.fromJson(Map<String, dynamic> json) =>
      _$RepositoryOwnerEntityFromJson(json);
}

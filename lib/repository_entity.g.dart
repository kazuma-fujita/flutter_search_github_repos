// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepositoryEntity _$_$_RepositoryEntityFromJson(Map<String, dynamic> json) {
  return _$_RepositoryEntity(
    id: json['id'] as int,
    fullName: json['full_name'] as String,
    description: json['description'] as String,
    language: json['language'] as String,
    htmlUrl: json['html_url'] as String,
    stargazersCount: json['stargazers_count'] as int,
    watchersCount: json['watchers_count'] as int,
    forksCount: json['forks_count'] as int,
    owner: json['owner'] == null
        ? null
        : RepositoryOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_RepositoryEntityToJson(
        _$_RepositoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'description': instance.description,
      'language': instance.language,
      'html_url': instance.htmlUrl,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'forks_count': instance.forksCount,
      'owner': instance.owner,
    };

_$_RepositoryOwnerEntity _$_$_RepositoryOwnerEntityFromJson(
    Map<String, dynamic> json) {
  return _$_RepositoryOwnerEntity(
    avatarUrl: json['avatar_url'] as String,
  );
}

Map<String, dynamic> _$_$_RepositoryOwnerEntityToJson(
        _$_RepositoryOwnerEntity instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatarUrl,
    };

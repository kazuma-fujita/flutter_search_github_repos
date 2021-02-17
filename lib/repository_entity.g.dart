// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepositoryEntity _$_$_RepositoryEntityFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_RepositoryEntity', json, () {
    final val = _$_RepositoryEntity(
      id: $checkedConvert(json, 'id', (v) => v as int),
      fullName: $checkedConvert(json, 'full_name', (v) => v as String),
      description: $checkedConvert(json, 'description', (v) => v as String),
      language: $checkedConvert(json, 'language', (v) => v as String),
      htmlUrl: $checkedConvert(json, 'html_url', (v) => v as String),
      stargazersCount:
          $checkedConvert(json, 'stargazers_count', (v) => v as int),
      watchersCount: $checkedConvert(json, 'watchers_count', (v) => v as int),
      forksCount: $checkedConvert(json, 'forks_count', (v) => v as int),
      owner: $checkedConvert(
          json,
          'owner',
          (v) => v == null
              ? null
              : RepositoryOwnerEntity.fromJson(v as Map<String, dynamic>)),
    );
    return val;
  }, fieldKeyMap: const {
    'fullName': 'full_name',
    'htmlUrl': 'html_url',
    'stargazersCount': 'stargazers_count',
    'watchersCount': 'watchers_count',
    'forksCount': 'forks_count'
  });
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
  return $checkedNew(r'_$_RepositoryOwnerEntity', json, () {
    final val = _$_RepositoryOwnerEntity(
      avatarUrl: $checkedConvert(json, 'avatar_url', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {'avatarUrl': 'avatar_url'});
}

Map<String, dynamic> _$_$_RepositoryOwnerEntityToJson(
        _$_RepositoryOwnerEntity instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatarUrl,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'repository_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RepositoryEntity _$RepositoryEntityFromJson(Map<String, dynamic> json) {
  return _RepositoryEntity.fromJson(json);
}

/// @nodoc
class _$RepositoryEntityTearOff {
  const _$RepositoryEntityTearOff();

// ignore: unused_element
  _RepositoryEntity call(
      {@required int id,
      @required String fullName,
      String description,
      String language,
      @required String htmlUrl,
      @required int stargazersCount,
      @required int watchersCount,
      @required int forksCount,
      @required RepositoryOwnerEntity owner}) {
    return _RepositoryEntity(
      id: id,
      fullName: fullName,
      description: description,
      language: language,
      htmlUrl: htmlUrl,
      stargazersCount: stargazersCount,
      watchersCount: watchersCount,
      forksCount: forksCount,
      owner: owner,
    );
  }

// ignore: unused_element
  RepositoryEntity fromJson(Map<String, Object> json) {
    return RepositoryEntity.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RepositoryEntity = _$RepositoryEntityTearOff();

/// @nodoc
mixin _$RepositoryEntity {
  int get id;
  String get fullName;
  String get description;
  String get language;
  String get htmlUrl;
  int get stargazersCount;
  int get watchersCount;
  int get forksCount;
  RepositoryOwnerEntity get owner;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $RepositoryEntityCopyWith<RepositoryEntity> get copyWith;
}

/// @nodoc
abstract class $RepositoryEntityCopyWith<$Res> {
  factory $RepositoryEntityCopyWith(
          RepositoryEntity value, $Res Function(RepositoryEntity) then) =
      _$RepositoryEntityCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String fullName,
      String description,
      String language,
      String htmlUrl,
      int stargazersCount,
      int watchersCount,
      int forksCount,
      RepositoryOwnerEntity owner});

  $RepositoryOwnerEntityCopyWith<$Res> get owner;
}

/// @nodoc
class _$RepositoryEntityCopyWithImpl<$Res>
    implements $RepositoryEntityCopyWith<$Res> {
  _$RepositoryEntityCopyWithImpl(this._value, this._then);

  final RepositoryEntity _value;
  // ignore: unused_field
  final $Res Function(RepositoryEntity) _then;

  @override
  $Res call({
    Object id = freezed,
    Object fullName = freezed,
    Object description = freezed,
    Object language = freezed,
    Object htmlUrl = freezed,
    Object stargazersCount = freezed,
    Object watchersCount = freezed,
    Object forksCount = freezed,
    Object owner = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      fullName: fullName == freezed ? _value.fullName : fullName as String,
      description:
          description == freezed ? _value.description : description as String,
      language: language == freezed ? _value.language : language as String,
      htmlUrl: htmlUrl == freezed ? _value.htmlUrl : htmlUrl as String,
      stargazersCount: stargazersCount == freezed
          ? _value.stargazersCount
          : stargazersCount as int,
      watchersCount: watchersCount == freezed
          ? _value.watchersCount
          : watchersCount as int,
      forksCount: forksCount == freezed ? _value.forksCount : forksCount as int,
      owner: owner == freezed ? _value.owner : owner as RepositoryOwnerEntity,
    ));
  }

  @override
  $RepositoryOwnerEntityCopyWith<$Res> get owner {
    if (_value.owner == null) {
      return null;
    }
    return $RepositoryOwnerEntityCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value));
    });
  }
}

/// @nodoc
abstract class _$RepositoryEntityCopyWith<$Res>
    implements $RepositoryEntityCopyWith<$Res> {
  factory _$RepositoryEntityCopyWith(
          _RepositoryEntity value, $Res Function(_RepositoryEntity) then) =
      __$RepositoryEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String fullName,
      String description,
      String language,
      String htmlUrl,
      int stargazersCount,
      int watchersCount,
      int forksCount,
      RepositoryOwnerEntity owner});

  @override
  $RepositoryOwnerEntityCopyWith<$Res> get owner;
}

/// @nodoc
class __$RepositoryEntityCopyWithImpl<$Res>
    extends _$RepositoryEntityCopyWithImpl<$Res>
    implements _$RepositoryEntityCopyWith<$Res> {
  __$RepositoryEntityCopyWithImpl(
      _RepositoryEntity _value, $Res Function(_RepositoryEntity) _then)
      : super(_value, (v) => _then(v as _RepositoryEntity));

  @override
  _RepositoryEntity get _value => super._value as _RepositoryEntity;

  @override
  $Res call({
    Object id = freezed,
    Object fullName = freezed,
    Object description = freezed,
    Object language = freezed,
    Object htmlUrl = freezed,
    Object stargazersCount = freezed,
    Object watchersCount = freezed,
    Object forksCount = freezed,
    Object owner = freezed,
  }) {
    return _then(_RepositoryEntity(
      id: id == freezed ? _value.id : id as int,
      fullName: fullName == freezed ? _value.fullName : fullName as String,
      description:
          description == freezed ? _value.description : description as String,
      language: language == freezed ? _value.language : language as String,
      htmlUrl: htmlUrl == freezed ? _value.htmlUrl : htmlUrl as String,
      stargazersCount: stargazersCount == freezed
          ? _value.stargazersCount
          : stargazersCount as int,
      watchersCount: watchersCount == freezed
          ? _value.watchersCount
          : watchersCount as int,
      forksCount: forksCount == freezed ? _value.forksCount : forksCount as int,
      owner: owner == freezed ? _value.owner : owner as RepositoryOwnerEntity,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RepositoryEntity
    with DiagnosticableTreeMixin
    implements _RepositoryEntity {
  const _$_RepositoryEntity(
      {@required this.id,
      @required this.fullName,
      this.description,
      this.language,
      @required this.htmlUrl,
      @required this.stargazersCount,
      @required this.watchersCount,
      @required this.forksCount,
      @required this.owner})
      : assert(id != null),
        assert(fullName != null),
        assert(htmlUrl != null),
        assert(stargazersCount != null),
        assert(watchersCount != null),
        assert(forksCount != null),
        assert(owner != null);

  factory _$_RepositoryEntity.fromJson(Map<String, dynamic> json) =>
      _$_$_RepositoryEntityFromJson(json);

  @override
  final int id;
  @override
  final String fullName;
  @override
  final String description;
  @override
  final String language;
  @override
  final String htmlUrl;
  @override
  final int stargazersCount;
  @override
  final int watchersCount;
  @override
  final int forksCount;
  @override
  final RepositoryOwnerEntity owner;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RepositoryEntity(id: $id, fullName: $fullName, description: $description, language: $language, htmlUrl: $htmlUrl, stargazersCount: $stargazersCount, watchersCount: $watchersCount, forksCount: $forksCount, owner: $owner)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RepositoryEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('fullName', fullName))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('htmlUrl', htmlUrl))
      ..add(DiagnosticsProperty('stargazersCount', stargazersCount))
      ..add(DiagnosticsProperty('watchersCount', watchersCount))
      ..add(DiagnosticsProperty('forksCount', forksCount))
      ..add(DiagnosticsProperty('owner', owner));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RepositoryEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.htmlUrl, htmlUrl) ||
                const DeepCollectionEquality()
                    .equals(other.htmlUrl, htmlUrl)) &&
            (identical(other.stargazersCount, stargazersCount) ||
                const DeepCollectionEquality()
                    .equals(other.stargazersCount, stargazersCount)) &&
            (identical(other.watchersCount, watchersCount) ||
                const DeepCollectionEquality()
                    .equals(other.watchersCount, watchersCount)) &&
            (identical(other.forksCount, forksCount) ||
                const DeepCollectionEquality()
                    .equals(other.forksCount, forksCount)) &&
            (identical(other.owner, owner) ||
                const DeepCollectionEquality().equals(other.owner, owner)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(htmlUrl) ^
      const DeepCollectionEquality().hash(stargazersCount) ^
      const DeepCollectionEquality().hash(watchersCount) ^
      const DeepCollectionEquality().hash(forksCount) ^
      const DeepCollectionEquality().hash(owner);

  @JsonKey(ignore: true)
  @override
  _$RepositoryEntityCopyWith<_RepositoryEntity> get copyWith =>
      __$RepositoryEntityCopyWithImpl<_RepositoryEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RepositoryEntityToJson(this);
  }
}

abstract class _RepositoryEntity implements RepositoryEntity {
  const factory _RepositoryEntity(
      {@required int id,
      @required String fullName,
      String description,
      String language,
      @required String htmlUrl,
      @required int stargazersCount,
      @required int watchersCount,
      @required int forksCount,
      @required RepositoryOwnerEntity owner}) = _$_RepositoryEntity;

  factory _RepositoryEntity.fromJson(Map<String, dynamic> json) =
      _$_RepositoryEntity.fromJson;

  @override
  int get id;
  @override
  String get fullName;
  @override
  String get description;
  @override
  String get language;
  @override
  String get htmlUrl;
  @override
  int get stargazersCount;
  @override
  int get watchersCount;
  @override
  int get forksCount;
  @override
  RepositoryOwnerEntity get owner;
  @override
  @JsonKey(ignore: true)
  _$RepositoryEntityCopyWith<_RepositoryEntity> get copyWith;
}

RepositoryOwnerEntity _$RepositoryOwnerEntityFromJson(
    Map<String, dynamic> json) {
  return _RepositoryOwnerEntity.fromJson(json);
}

/// @nodoc
class _$RepositoryOwnerEntityTearOff {
  const _$RepositoryOwnerEntityTearOff();

// ignore: unused_element
  _RepositoryOwnerEntity call({@required String avatarUrl}) {
    return _RepositoryOwnerEntity(
      avatarUrl: avatarUrl,
    );
  }

// ignore: unused_element
  RepositoryOwnerEntity fromJson(Map<String, Object> json) {
    return RepositoryOwnerEntity.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RepositoryOwnerEntity = _$RepositoryOwnerEntityTearOff();

/// @nodoc
mixin _$RepositoryOwnerEntity {
  String get avatarUrl;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $RepositoryOwnerEntityCopyWith<RepositoryOwnerEntity> get copyWith;
}

/// @nodoc
abstract class $RepositoryOwnerEntityCopyWith<$Res> {
  factory $RepositoryOwnerEntityCopyWith(RepositoryOwnerEntity value,
          $Res Function(RepositoryOwnerEntity) then) =
      _$RepositoryOwnerEntityCopyWithImpl<$Res>;
  $Res call({String avatarUrl});
}

/// @nodoc
class _$RepositoryOwnerEntityCopyWithImpl<$Res>
    implements $RepositoryOwnerEntityCopyWith<$Res> {
  _$RepositoryOwnerEntityCopyWithImpl(this._value, this._then);

  final RepositoryOwnerEntity _value;
  // ignore: unused_field
  final $Res Function(RepositoryOwnerEntity) _then;

  @override
  $Res call({
    Object avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      avatarUrl: avatarUrl == freezed ? _value.avatarUrl : avatarUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$RepositoryOwnerEntityCopyWith<$Res>
    implements $RepositoryOwnerEntityCopyWith<$Res> {
  factory _$RepositoryOwnerEntityCopyWith(_RepositoryOwnerEntity value,
          $Res Function(_RepositoryOwnerEntity) then) =
      __$RepositoryOwnerEntityCopyWithImpl<$Res>;
  @override
  $Res call({String avatarUrl});
}

/// @nodoc
class __$RepositoryOwnerEntityCopyWithImpl<$Res>
    extends _$RepositoryOwnerEntityCopyWithImpl<$Res>
    implements _$RepositoryOwnerEntityCopyWith<$Res> {
  __$RepositoryOwnerEntityCopyWithImpl(_RepositoryOwnerEntity _value,
      $Res Function(_RepositoryOwnerEntity) _then)
      : super(_value, (v) => _then(v as _RepositoryOwnerEntity));

  @override
  _RepositoryOwnerEntity get _value => super._value as _RepositoryOwnerEntity;

  @override
  $Res call({
    Object avatarUrl = freezed,
  }) {
    return _then(_RepositoryOwnerEntity(
      avatarUrl: avatarUrl == freezed ? _value.avatarUrl : avatarUrl as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RepositoryOwnerEntity
    with DiagnosticableTreeMixin
    implements _RepositoryOwnerEntity {
  const _$_RepositoryOwnerEntity({@required this.avatarUrl})
      : assert(avatarUrl != null);

  factory _$_RepositoryOwnerEntity.fromJson(Map<String, dynamic> json) =>
      _$_$_RepositoryOwnerEntityFromJson(json);

  @override
  final String avatarUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RepositoryOwnerEntity(avatarUrl: $avatarUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RepositoryOwnerEntity'))
      ..add(DiagnosticsProperty('avatarUrl', avatarUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RepositoryOwnerEntity &&
            (identical(other.avatarUrl, avatarUrl) ||
                const DeepCollectionEquality()
                    .equals(other.avatarUrl, avatarUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(avatarUrl);

  @JsonKey(ignore: true)
  @override
  _$RepositoryOwnerEntityCopyWith<_RepositoryOwnerEntity> get copyWith =>
      __$RepositoryOwnerEntityCopyWithImpl<_RepositoryOwnerEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RepositoryOwnerEntityToJson(this);
  }
}

abstract class _RepositoryOwnerEntity implements RepositoryOwnerEntity {
  const factory _RepositoryOwnerEntity({@required String avatarUrl}) =
      _$_RepositoryOwnerEntity;

  factory _RepositoryOwnerEntity.fromJson(Map<String, dynamic> json) =
      _$_RepositoryOwnerEntity.fromJson;

  @override
  String get avatarUrl;
  @override
  @JsonKey(ignore: true)
  _$RepositoryOwnerEntityCopyWith<_RepositoryOwnerEntity> get copyWith;
}

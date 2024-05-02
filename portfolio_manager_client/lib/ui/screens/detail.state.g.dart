// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DetailStateCWProxy {
  DetailState document(DocumentEntity? document);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  DetailState call({
    DocumentEntity? document,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDetailState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDetailState.copyWith.fieldName(...)`
class _$DetailStateCWProxyImpl implements _$DetailStateCWProxy {
  const _$DetailStateCWProxyImpl(this._value);

  final DetailState _value;

  @override
  DetailState document(DocumentEntity? document) => this(document: document);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  DetailState call({
    Object? document = const $CopyWithPlaceholder(),
  }) {
    return DetailState(
      document: document == const $CopyWithPlaceholder()
          ? _value.document
          // ignore: cast_nullable_to_non_nullable
          : document as DocumentEntity?,
    );
  }
}

extension $DetailStateCopyWith on DetailState {
  /// Returns a callable class that can be used as follows: `instanceOfDetailState.copyWith(...)` or like so:`instanceOfDetailState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DetailStateCWProxy get copyWith => _$DetailStateCWProxyImpl(this);
}

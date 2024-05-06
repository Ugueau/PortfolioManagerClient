// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_project.state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ManageProjectStateCWProxy {
  ManageProjectState newDocuments(DocumentEntity? newDocuments);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ManageProjectState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ManageProjectState(...).copyWith(id: 12, name: "My name")
  /// ````
  ManageProjectState call({
    DocumentEntity? newDocuments,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfManageProjectState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfManageProjectState.copyWith.fieldName(...)`
class _$ManageProjectStateCWProxyImpl implements _$ManageProjectStateCWProxy {
  const _$ManageProjectStateCWProxyImpl(this._value);

  final ManageProjectState _value;

  @override
  ManageProjectState newDocuments(DocumentEntity? newDocuments) =>
      this(newDocuments: newDocuments);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ManageProjectState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ManageProjectState(...).copyWith(id: 12, name: "My name")
  /// ````
  ManageProjectState call({
    Object? newDocuments = const $CopyWithPlaceholder(),
  }) {
    return ManageProjectState(
      newDocuments: newDocuments == const $CopyWithPlaceholder()
          ? _value.newDocuments
          // ignore: cast_nullable_to_non_nullable
          : newDocuments as DocumentEntity?,
    );
  }
}

extension $ManageProjectStateCopyWith on ManageProjectState {
  /// Returns a callable class that can be used as follows: `instanceOfManageProjectState.copyWith(...)` or like so:`instanceOfManageProjectState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ManageProjectStateCWProxy get copyWith =>
      _$ManageProjectStateCWProxyImpl(this);
}

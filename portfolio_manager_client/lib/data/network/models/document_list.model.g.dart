// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_list.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentListModel _$DocumentListModelFromJson(Map<String, dynamic> json) =>
    DocumentListModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => DocumentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DocumentListModelToJson(DocumentListModel instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

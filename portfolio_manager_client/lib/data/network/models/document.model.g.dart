// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentModel _$DocumentModelFromJson(Map<String, dynamic> json) =>
    DocumentModel(
      json['img_path'] as String?,
      json['title'] as String?,
      json['descr'] as String?,
      json['creation_date'] as String?,
      (json['id'] as num).toInt(),
      json['category_titles'] as String,
    );

Map<String, dynamic> _$DocumentModelToJson(DocumentModel instance) =>
    <String, dynamic>{
      'img_path': instance.img_path,
      'title': instance.title,
      'descr': instance.descr,
      'creation_date': instance.creation_date,
      'id': instance.id,
      'category_titles': instance.category_titles,
    };

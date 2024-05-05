// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentModel _$DocumentModelFromJson(Map<String, dynamic> json) =>
    DocumentModel(
      json['title'] as String?,
      json['descr'] as String?,
      json['link'] as String?,
      json['creation_date'] as String?,
      (json['id'] as num).toInt(),
      (json['categories'] as List<dynamic>).map((e) => e as String).toList(),
      (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DocumentModelToJson(DocumentModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'descr': instance.descr,
      'link': instance.link,
      'creation_date': instance.creation_date,
      'id': instance.id,
      'categories': instance.categories,
      'images': instance.images,
    };

import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio_manager_client/domain/entities/document.entity.dart';

part 'document.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DocumentModel {
  final String? title;
  final String? descr;
  final String? link;
  final String? creation_date;
  final int id;
  final List<String> categories;
  final List<String> images;


  const DocumentModel(this.title, this.descr, this.link, this.creation_date, this.id, this.categories, this.images);

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentModelToJson(this);

  DocumentEntity get toEntity => DocumentEntity(title: title, descr: descr, link:link, creationDate: creation_date, id: id, categories: categories, images : images);
}
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio_manager_client/domain/entities/document.entity.dart';

part 'document.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DocumentModel {
  final String? img_path;
  final String? title;
  final String? descr;
  final String? creation_date;
  final int id;
  final String category_titles;


  const DocumentModel(this.img_path, this.title, this.descr, this.creation_date, this.id, this.category_titles);

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentModelToJson(this);

  DocumentEntity get toEntity => DocumentEntity(imgPath: "http://localhost:3000/image/$img_path", title: title, descr: descr, creationDate: creation_date, id: id, categoryTitles: category_titles);
}
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio_manager_client/domain/entities/document_list.entity.dart';

part 'document_list.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DocumentListModel {
  final int? totalCount;

  const DocumentListModel({required this.totalCount});

  factory DocumentListModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentListModelFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentListModelToJson(this);

  DocumentListEntity get toEntity => DocumentListEntity(totalCount: totalCount);
}

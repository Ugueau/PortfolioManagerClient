import 'package:portfolio_manager_client/domain/entities/document_list.entity.dart';

abstract class DocumentsRepository {
  Future<DocumentListEntity> getDocuments({int offset = 0});
}

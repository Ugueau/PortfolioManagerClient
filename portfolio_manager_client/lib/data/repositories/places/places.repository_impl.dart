import 'package:injectable/injectable.dart';
import 'package:portfolio_manager_client/data/data_source/documents/remote/remote.data_source.dart';
import 'package:portfolio_manager_client/data/network/models/document_list.model.dart';
import 'package:portfolio_manager_client/domain/entities/document_list.entity.dart';
import 'package:portfolio_manager_client/domain/repository/documents.repository.dart';

@Singleton(as: DocumentsRepository)
class DocumentsRepositoryImpl implements DocumentsRepository {
  final DocumentListRemoteDataSource _documentListRemoteDataSource;

  DocumentsRepositoryImpl({required DocumentListRemoteDataSource documentListRemoteDataSource})
      : _documentListRemoteDataSource = documentListRemoteDataSource;

  @override
  Future<DocumentListEntity> getDocuments({int offset = 0}) async {
    final DocumentListModel model = await _documentListRemoteDataSource.getDocuments(offset: offset);
    return model.toEntity;
  }

}

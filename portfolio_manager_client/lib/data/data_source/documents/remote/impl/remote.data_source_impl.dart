import 'package:injectable/injectable.dart';
import 'package:portfolio_manager_client/data/data_source/documents/remote/remote.data_source.dart';
import 'package:portfolio_manager_client/data/network/endpoints/document_list.endpoint.dart';
import 'package:portfolio_manager_client/data/network/models/document_list.model.dart';

@Singleton(as: DocumentListRemoteDataSource)
class DocumentListRemoteDataSourceImpl implements DocumentListRemoteDataSource {
  final DocumentListEndpoint _documentListEndpoint;

  DocumentListRemoteDataSourceImpl({required DocumentListEndpoint documentListEndpoint})
      : _documentListEndpoint = documentListEndpoint;
  @override
  Future<DocumentListModel> getDocuments({int offset = 0}) {
    return _documentListEndpoint.getDocuments();
  }
}

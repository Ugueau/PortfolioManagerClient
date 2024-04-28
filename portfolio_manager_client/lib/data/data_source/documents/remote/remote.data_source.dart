import 'package:portfolio_manager_client/data/network/models/document_list.model.dart';

abstract class DocumentListRemoteDataSource {
  Future<DocumentListModel> getDocuments();
}

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../entities/document.entity.dart';
import '../entities/document_list.entity.dart';
import '../repository/documents.repository.dart';

@singleton
class DocumentManager{
  final DocumentsRepository _documentsRepository;
  DocumentListEntity? _currentDocumentList;
  DocumentManager(DocumentsRepository documentsRepository): _documentsRepository = documentsRepository;
  final Connectivity _connectivity = Connectivity();

  Future<DocumentListEntity> getDocuments() async{
    return _currentDocumentList ?? await fetchDocuments();
  }

  Future<DocumentListEntity> fetchDocuments() async{
    var connectivityResult = await _connectivity.checkConnectivity();
    if(connectivityResult.contains(ConnectivityResult.none)){
      return _currentDocumentList!;
    }
    try {
      DocumentListEntity fetchedDocuments = await _documentsRepository.getDocuments(
          offset: _currentDocumentList?.data != null ? _currentDocumentList!.data
              .length : 0);
      DocumentListEntity? tmp = _currentDocumentList;
      if (tmp == null) {
        tmp = fetchedDocuments;
      } else {
        tmp.data.addAll(fetchedDocuments.data);
      }
      _currentDocumentList = tmp;
      return _currentDocumentList!;
    }on Exception
    catch(e){
      if(_currentDocumentList == null){
        return const DocumentListEntity(data: []);
      }
      return _currentDocumentList!;
    }
  }

}
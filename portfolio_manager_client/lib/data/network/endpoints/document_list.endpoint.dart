import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:portfolio_manager_client/data/network/models/document_list.model.dart';
import 'package:portfolio_manager_client/foundation/client/dio.client.dart';

part 'document_list.endpoint.g.dart';

///
/// [PlacesEndpoint]
///
@RestApi()
@singleton
abstract class DocumentListEndpoint {
  ///
  @factoryMethod
  factory DocumentListEndpoint(DioClient dio) {
    return _DocumentListEndpoint(dio);
  }

  ///
  @GET('/documents')
  Future<DocumentListModel> getDocuments({@Query('limit') int limit = 20});
}

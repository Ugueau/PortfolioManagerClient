// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:portfolio_manager_client/data/data_source/documents/remote/impl/remote.data_source_impl.dart'
    as _i7;
import 'package:portfolio_manager_client/data/data_source/documents/remote/remote.data_source.dart'
    as _i6;
import 'package:portfolio_manager_client/data/network/endpoints/document_list.endpoint.dart'
    as _i4;
import 'package:portfolio_manager_client/data/repositories/places/places.repository_impl.dart'
    as _i9;
import 'package:portfolio_manager_client/domain/manager/document.manager.dart'
    as _i10;
import 'package:portfolio_manager_client/domain/repository/documents.repository.dart'
    as _i8;
import 'package:portfolio_manager_client/foundation/client/dio.client.dart'
    as _i3;
import 'package:portfolio_manager_client/foundation/client/interceptors/header.interceptor.dart'
    as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.DioClient>(() => _i3.DioClient());
    gh.singleton<_i4.DocumentListEndpoint>(
        () => _i4.DocumentListEndpoint(gh<_i3.DioClient>()));
    gh.singleton<_i5.HeaderInterceptor>(
        () => _i5.HeaderInterceptor(dioClient: gh<_i3.DioClient>()));
    gh.singleton<_i6.DocumentListRemoteDataSource>(() =>
        _i7.DocumentListRemoteDataSourceImpl(
            documentListEndpoint: gh<_i4.DocumentListEndpoint>()));
    gh.singleton<_i8.DocumentsRepository>(() => _i9.DocumentsRepositoryImpl(
        documentListRemoteDataSource: gh<_i6.DocumentListRemoteDataSource>()));
    gh.singleton<_i10.DocumentManager>(
        () => _i10.DocumentManager(gh<_i8.DocumentsRepository>()));
    return this;
  }
}

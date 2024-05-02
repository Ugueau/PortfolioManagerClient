import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_manager_client/application/injections/initializer.dart';
import 'package:portfolio_manager_client/domain/entities/document_list.entity.dart';
import 'package:portfolio_manager_client/ui/abstraction/view_model_abs.dart';
import 'package:portfolio_manager_client/ui/screens/home.state.dart';

import '../../domain/manager/document.manager.dart';

///
final StateNotifierProvider<HomeViewModel, HomeState> homeProvider =
    StateNotifierProvider<HomeViewModel, HomeState>(
  (StateNotifierProviderRef<HomeViewModel, HomeState> ref) => HomeViewModel(
    documentManager: injector<DocumentManager>(),
  ),
);

class HomeViewModel extends ViewModelAbs<HomeViewModel, HomeState> {
  final DocumentManager _documentManager;

  HomeViewModel({required DocumentManager documentManager})
      : _documentManager = documentManager,
        super(const HomeState.initial()) {
    _init();
  }

  void updateLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  void _init() {
    // TODO - api call
    fetchDocuments();
  }

  void fetchDocuments() async {
    try{
      DocumentListEntity fetchedDocuments = await _documentManager.fetchDocuments();
      state = state.copyWith(documents: fetchedDocuments);
    }on Exception
    catch(_, e){

    }
  }
}

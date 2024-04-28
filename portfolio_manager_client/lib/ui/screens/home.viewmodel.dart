import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_manager_client/application/injections/initializer.dart';
import 'package:portfolio_manager_client/domain/repository/documents.repository.dart';
import 'package:portfolio_manager_client/ui/abstraction/view_model_abs.dart';
import 'package:portfolio_manager_client/ui/screens/home.state.dart';

///
final StateNotifierProvider<HomeViewModel, HomeState> homeProvider =
    StateNotifierProvider<HomeViewModel, HomeState>(
  (StateNotifierProviderRef<HomeViewModel, HomeState> ref) => HomeViewModel(
    documentsRepository: injector<DocumentsRepository>(),
  ),
);

class HomeViewModel extends ViewModelAbs<HomeViewModel, HomeState> {
  final DocumentsRepository _documentsRepository;

  HomeViewModel({required DocumentsRepository documentsRepository})
      : _documentsRepository = documentsRepository,
        super(const HomeState.initial()) {
    _init();
  }

  void updateLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  void _init() {
    // TODO - api call
    _documentsRepository.getDocuments();
  }
}

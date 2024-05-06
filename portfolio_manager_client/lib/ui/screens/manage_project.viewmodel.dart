import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_manager_client/application/injections/initializer.dart';
import 'package:portfolio_manager_client/ui/abstraction/view_model_abs.dart';

import '../../domain/manager/document.manager.dart';
import 'manage_project.state.dart';

///
final StateNotifierProvider<ManageProjectViewModel, ManageProjectState> manageProjectProvider =
StateNotifierProvider<ManageProjectViewModel, ManageProjectState>(
      (StateNotifierProviderRef<ManageProjectViewModel, ManageProjectState> ref) => ManageProjectViewModel(
    documentManager: injector<DocumentManager>(),
  ),
);

class ManageProjectViewModel extends ViewModelAbs<ManageProjectViewModel, ManageProjectState> {
  final DocumentManager _documentManager;

  ManageProjectViewModel({required DocumentManager documentManager})
      : _documentManager = documentManager,
        super(const ManageProjectState.initial()) {
    _init();
  }

  void _init() {

  }

}

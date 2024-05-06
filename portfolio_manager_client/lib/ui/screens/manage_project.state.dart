import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:portfolio_manager_client/ui/abstraction/view_state_abs.dart';

import '../../domain/entities/document.entity.dart';

part 'manage_project.state.g.dart';

@CopyWith()
class ManageProjectState extends ViewStateAbs {
  final DocumentEntity? newDocuments;

  const ManageProjectState({required this.newDocuments});

  const ManageProjectState.initial() : newDocuments = null;

  @override
  List<Object?> get props => <Object?>[
    newDocuments,
  ];
}

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:portfolio_manager_client/domain/entities/document_list.entity.dart';
import 'package:portfolio_manager_client/ui/abstraction/view_state_abs.dart';

part 'home.state.g.dart';

@CopyWith()
class HomeState extends ViewStateAbs {
  final bool loading;
  final DocumentListEntity? documents;

  const HomeState({required this.loading, required this.documents});

  const HomeState.initial() : loading = false, documents = null;

  @override
  List<Object?> get props => <Object?>[
        loading,
        documents,
      ];
}

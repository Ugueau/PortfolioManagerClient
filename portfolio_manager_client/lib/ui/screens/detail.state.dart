import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:portfolio_manager_client/domain/entities/document.entity.dart';

import '../abstraction/view_state_abs.dart';

part 'detail.state.g.dart';

@CopyWith()
class DetailState extends ViewStateAbs {

  final DocumentEntity? document;

  const DetailState({required this.document});

  const DetailState.initial() : document = null;

  @override
  List<Object?> get props => <Object?>[
    document
  ];
}
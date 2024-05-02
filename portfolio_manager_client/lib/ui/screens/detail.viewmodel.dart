import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/document.entity.dart';
import '../abstraction/view_model_abs.dart';
import 'detail.state.dart';

final StateNotifierProvider<DetailViewModel, DetailState> detailProvider =
StateNotifierProvider<DetailViewModel, DetailState>(
      (StateNotifierProviderRef<DetailViewModel, DetailState> ref) => DetailViewModel(
  ),
);

class DetailViewModel extends ViewModelAbs<DetailViewModel, DetailState> {

  DetailViewModel()
      : super(const DetailState.initial()) {
    _init();
  }

  void _init() async {

  }

  void setPlace(DocumentEntity document) async{
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state = state.copyWith(document: document);
    });
  }
}
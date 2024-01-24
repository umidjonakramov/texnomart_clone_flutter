import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:texnomart_clone_flutter/data/source/models/branchs/filial_model.dart';

import '../../../../data/source/repository/app_repository.dart';
import '../../../../di/di.dart';

part 'branchs_event.dart';

part 'branchs_state.dart';

class BranchsBloc extends Bloc<BranchsEvent, BranchsState> {
  final _repository = getIt<AppRepository>();

  BranchsBloc() : super(BranchsInitial()) {
    on<GetAllBranchEvent>((event, emit) async {
      emit(LoadingState());
      final data = await _repository.getAllCategories();
      emit(GetAllBranchState(data as OpenedStore));
    });
    on<ClickItem>((event, emit) {
      emit(ClickItemState(event.data, event.name));
    });
  }
}

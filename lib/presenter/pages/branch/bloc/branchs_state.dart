part of 'branchs_bloc.dart';

@immutable
abstract class BranchsState {}

class BranchsInitial extends BranchsState {}

class GetAllBranchState extends BranchsState {
  final OpenedStore data;

  GetAllBranchState(this.data);
}
class ClickItemState extends BranchsState {
  final List<OpenedStore> data;
  final String name;

  ClickItemState(this.data, this.name);
}
class LoadingState extends BranchsState {}

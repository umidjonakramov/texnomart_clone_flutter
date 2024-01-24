part of 'branchs_bloc.dart';

@immutable
abstract class BranchsEvent {}

class GetAllBranchEvent extends BranchsEvent {}

class ClickItem extends BranchsEvent {
  final List<OpenedStore> data;
  final String name;

  ClickItem(this.data, this.name);
}

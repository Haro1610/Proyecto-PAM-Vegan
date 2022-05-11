part of 'pending_bloc.dart';

abstract class PendingState extends Equatable {
  const PendingState();

  @override
  List<Object> get props => [];
}

class PendingInitial extends PendingState {}

class PendingFotosSuccessState extends PendingState {
  // lista de elementos de firebase "fshare collection"
  final List<Map<String, dynamic>> myData;

  PendingFotosSuccessState({required this.myData});

  @override
  List<Object> get props => [myData];
}

class PendingFotosErrorState extends PendingState {}

class PendingFotosEmptyState extends PendingState {}

class PendingFotosLoadingState extends PendingState {}

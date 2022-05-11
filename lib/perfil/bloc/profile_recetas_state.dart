part of 'profile_recetas_bloc.dart';

abstract class ProfileRecetasState extends Equatable {
  const ProfileRecetasState();

  @override
  List<Object> get props => [];
}

class ProfileRecetasInitial extends ProfileRecetasState {}

class ProfileRecetasSuccessState extends ProfileRecetasState {
  // lista de elementos de firebase "fshare collection"
  final List<Map<String, dynamic>> myData;

  ProfileRecetasSuccessState({required this.myData});

  @override
  List<Object> get props => [myData];
}

class ProfileRecetasErrorState extends ProfileRecetasState {}

class ProfileRecetasEmptyState extends ProfileRecetasState {}

class ProfileRecetasLoadingState extends ProfileRecetasState {}

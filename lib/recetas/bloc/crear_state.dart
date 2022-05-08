part of 'crear_bloc.dart';

abstract class CrearState extends Equatable {
  const CrearState();

  @override
  List<Object> get props => [];
}

class CrearInitial extends CrearState {}

class CrearSuccessState extends CrearState {}

class CrearErrorState extends CrearState {}

class CrearLoadingState extends CrearState {}

class CrearPictureErrorState extends CrearState {}

class CrearPictureChangedState extends CrearState {
  final File picture;
  CrearPictureChangedState({required this.picture});
  @override
  List<Object> get props => [picture];
}

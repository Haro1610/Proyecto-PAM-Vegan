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

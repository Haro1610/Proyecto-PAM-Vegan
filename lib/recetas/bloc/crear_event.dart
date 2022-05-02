part of 'crear_bloc.dart';

abstract class CrearEvent extends Equatable {
  const CrearEvent();

  @override
  List<Object> get props => [];
}

//click al boton de foto
//class OnCrearTakePictureEvent extends CrearEvent {}

//click al boton de guardar
class OnCrearSaveDataEvent extends CrearEvent {
  final Map<String, dynamic> dataToSave;

  OnCrearSaveDataEvent({required this.dataToSave});
  @override
  List<Object> get props => [dataToSave];
}

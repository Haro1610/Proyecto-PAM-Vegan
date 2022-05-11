part of 'profile_recetas_bloc.dart';

abstract class ProfileRecetasEvent extends Equatable {
  const ProfileRecetasEvent();

  @override
  List<Object> get props => [];
}

class GetProfileRecetasEvent extends ProfileRecetasEvent {}

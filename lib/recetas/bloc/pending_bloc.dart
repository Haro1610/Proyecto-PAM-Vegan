import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'pending_event.dart';
part 'pending_state.dart';

class PendingBloc extends Bloc<PendingEvent, PendingState> {
  PendingBloc() : super(PendingInitial()) {
    on<PendingEvent>(_getMyContent);
  }

  FutureOr<void> _getMyContent(event, emit) async {
    emit(PendingFotosLoadingState());
    try {
      // query para sacar documentos de fshare
      var queryRecetas =
          await FirebaseFirestore.instance.collection("recetas").get();
      var myContentList = queryRecetas.docs
          .map((doc) => doc.data().cast<String, dynamic>())
          .toList();

      print(myContentList);

      // lista de documentos filtrados del usuario con sus datos de fotos en espera
      emit(PendingFotosSuccessState(myData: myContentList));
    } catch (e) {
      print("Error al obtener items en espera: $e");
      emit(PendingFotosErrorState());
      emit(PendingFotosEmptyState());
    }
  }
}

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
      // query para traer el documento con el id del usuario autenticado
      var queryUser = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid);

      // query para sacar la data del documento
      var docsRef = await queryUser.get();

      var listIds = docsRef.data()?["recetas"];

      print("---------------------------");
      print(listIds);
      print("---------------------------");

      // query para sacar documentos de fshare
      var queryFotos =
          await FirebaseFirestore.instance.collection("recetas").get();

      // query de Dart filtrando la info utilizando como referencia la lista de ids de docs del usuario actual
      var myContentList = queryFotos.docs
          .where((doc) => listIds.contains(doc.id))
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

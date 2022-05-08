import 'dart:async';
import 'dart:html';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'crear_event.dart';
part 'crear_state.dart';

class CrearBloc extends Bloc<CrearEvent, CrearState> {
  File? _selectedPicture;
  CrearBloc() : super(CrearInitial()) {
    on<OnCrearSaveDataEvent>(_saveData);
    on<OnCrearFotoEvent>(_tomarFoto);
  }

  FutureOr<void> _saveData(event, emit) async {
    emit(CrearLoadingState());
    bool saved = await _saveReceta(event.dataToSave);
    emit(saved ? CrearSuccessState() : CrearErrorState());
  }

  Future<bool> _saveReceta(Map<String, dynamic> dataToSave) async {
    Map<String, dynamic> mapaReceta = {};
    mapaReceta["#reseñas"] = 0;
    mapaReceta["autor"] = FirebaseAuth.instance.currentUser!.uid;
    mapaReceta["imagen"] = dataToSave["imagen"];
    mapaReceta["nombre"] = dataToSave["nombre"];
    mapaReceta["stars"] = 0;
    mapaReceta["procedimiento"] = dataToSave["procedimiento"];
    mapaReceta["ingredientes"] = dataToSave["ingredientes"];

    try {
      var docRef = await FirebaseFirestore.instance
          .collection("recetas")
          .add(mapaReceta);

      print(
          '--------------------------------------------------------------------------');
      print(docRef.id);
      return await _updateUserDocumentReference(docRef.id);
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  Future<bool> _updateUserDocumentReference(String recetaId) async {
    try {
      //query traer doc con id de user
      //query para traer el documento con el id d el usuario autenticado
      var queryUser = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid);

      //query para sacar la data del documento
      var docsRef = await queryUser.get();
      List<dynamic> listIds = docsRef.data()?["recetas"];

      //agregamos nuevo id
      listIds.add(recetaId);

      //guardar
      await queryUser.update({"recetas": listIds});
      return true;
    } catch (e) {
      print("Error al actualizar users collection: $e");
      return false;
    }
  }
}

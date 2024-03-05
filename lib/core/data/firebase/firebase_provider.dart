import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ready_structure/core/networking/errors/firebase_error.dart';
import 'package:ready_structure/core/networking/errors/unexpected_error.dart';
import 'package:ready_structure/core/networking/models/api/api_response_model.dart';
import 'package:ready_structure/core/networking/models/api/data/base_api_model.dart';
import 'package:ready_structure/core/networking/models/api/void_result/void_model.dart';
import 'package:ready_structure/core/networking/results/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ready_structure/features/auth/data/model/user_model.dart';

class FirebaseRDS {
  Future<Result<VoidApiResponse>> createUser(UserModel user) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email, password: user.password!);

      return Result(data: const VoidApiResponse());
    } on FirebaseException catch (e) {
      // Specific Firebase errors
      return Result(error: FirebaseError(e.message ?? "Firebase error"));
    } catch (e) {
      // General errors
      return Result(error: UnExpectedError(errorMessage: e.toString()));
    }
  }

  Future<Result<VoidApiResponse>> logInUser(UserModel user) async {
    try {
     await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email, password: user.password!);

      return Result(data: const VoidApiResponse());
    } on FirebaseException catch (e) {
      // Specific Firebase errors
      return Result(error: FirebaseError(e.message ?? "Firebase error"));
    } catch (e) {
      // General errors
      return Result(error: UnExpectedError(errorMessage: e.toString()));
    }
  }

  CollectionReference getCollection(String collection) {
    return FirebaseFirestore.instance.collection(collection);
  }

  Future<Result<D>> getData<D extends BaseApiDataModel>({
    required String collectionName,
    required ResponseConverter<D> converter,
  }) async {
    try {
      final QuerySnapshot snapshot = await getCollection(collectionName).get();
      final documents = snapshot.docs;
      Map<String, dynamic> map = {};
      map["items"] = documents.map((doc) {
        final map = doc.data() as Map<String, dynamic>;
        map["id"] = doc.id;
        return map;
      }).toList();

      D convertedDocument = converter(map);
      return Result(data: convertedDocument);
    } on FirebaseException catch (e) {
      // Specific Firebase errors
      return Result(error: FirebaseError(e.message ?? "Firebase error"));
    } catch (e) {
      // General errors
      return Result(error: UnExpectedError(errorMessage: e.toString()));
    }
  }

  Future<Result<VoidApiResponse>> updateData(
      {required String collection,
      required String docId,
      required Map<String, dynamic> data}) async {
    CollectionReference firebaseCollection;
    try {
      firebaseCollection = FirebaseFirestore.instance.collection(collection);
      await firebaseCollection.doc(docId).update(data);
      return Result(data: const VoidApiResponse());
    } on FirebaseException catch (e) {
      // Specific Firebase errors
      return Result(error: FirebaseError(e.message ?? "Firebase error"));
    } catch (e) {
      // General errors
      return Result(error: UnExpectedError(errorMessage: e.toString()));
    }
  }

  Future<Result<VoidApiResponse>> deleteData(
      {required String collectionName, required String id}) async {
    CollectionReference firebaseCollection;
    try {
      firebaseCollection =
          FirebaseFirestore.instance.collection(collectionName);
      await firebaseCollection.doc(id).delete();
      return Result(data: const VoidApiResponse());
    } on FirebaseException catch (e) {
      // Specific Firebase errors
      return Result(error: FirebaseError(e.message ?? "Firebase error"));
    } catch (e) {
      // General errors
      return Result(error: UnExpectedError(errorMessage: e.toString()));
    }
  }

  Future<Result<VoidApiResponse>> addData(
      {required String collectionName,
      required Map<String, dynamic> newItem}) async {
    try {
      CollectionReference firebaseCollection =
          FirebaseFirestore.instance.collection(collectionName);
      await firebaseCollection.add(newItem);

      return Result(data: const VoidApiResponse());
    } on FirebaseException catch (e) {
      // Specific Firebase errors
      return Result(error: FirebaseError(e.message ?? "Firebase error"));
    } catch (e) {
      // General errors
      return Result(error: UnExpectedError(errorMessage: e.toString()));
    }
  }
}

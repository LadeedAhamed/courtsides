import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courtsides/features/shop/models/category_model.dart';
import 'package:courtsides/utils/exceptions/firebase_exceptions.dart';
import 'package:courtsides/utils/exceptions/format_exceptions.dart';
import 'package:courtsides/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get All Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      return snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get Sub Categories
  Future<List<CategoryModel>> getSubCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      return snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}

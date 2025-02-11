
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tinder/features/shop/models/brand_category_model.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/exceptions/exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/firebase_storage_service.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db  =  FirebaseFirestore.instance ;
    /// Get all categories

  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot. docs. map((e) => BrandModel.fromSnapshot (e)).toList();
    return result;
     }   on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      } on FormatException catch ( _) {
      throw const TFormatException ();
      } on PlatformException catch (e){
          throw TPlatformException (e.code) .message;
        } catch (e) {
      throw 'Something went wrong while fetching Banners.';
      ;
    }
  }
    /// Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory') .where('categoryId', isEqualTo: categoryId) . get () ;
      // Extract brandIds from the documents
      List<String> brandIds = brandCategoryQuery. docs.map( (doc) => doc[ 'brandId'] as String).toList();

    // Query to get all documents where the brandId is in the list of brandIds, FieldPath. documentId to query documents in Collection
    final brandsQuery = await _db.collection('Brands') .where (FieldPath.documentId, whereIn: brandIds).limit (2) .get() ;
    // Extract brand names or other relevant data from the documents
    List <BrandModel> brands = brandsQuery. docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
    return brands;

    }   on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch ( _) {
      throw const TFormatException ();
    } on PlatformException catch (e){
      throw TPlatformException (e.code) .message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
      ;
    }
  }

  /// Upload Brands to the Cloud Firebase
  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try{
      // Upload all the Categories along with their Images
      final storage = Get.put (TFirebaseStorageService ());

      // Loop through each category
      for (var brand in brands) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets (brand.image);

        // Upload Image and Get its URL
        final url = await storage. uploadImageData('Brands/images', file, brand.name);
        // Assign URL to Category. image attribute
        brand.image = url;
       // brand.image="https://firebasestorage.googleapis.com/v0/b/tinder-c2ca6.firebasestorage.app/o/Products%2FImages%2Fassets%2Fimages%2Fbanners%2Fpromo-banner-2.png?alt=media&token=89376112-ff6a-44b1-8f93-3a4de8f1fff5";
        // Store Category in Firestore
        await _db.collection ("Brands").doc (brand.id).set (brand.toJson ());

      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException (e.code) .message;
    } catch(e)
    {
      throw 'Something went wrong. Please try again';

    }
  }

  /// upload Brand_Category
  Future<void> uploadBrandsOfCategoryDummyData(List<BrandCategoryModel> brandsCategory) async {
    try{
      // Upload all the Categories along with their Images

      // Loop through each category
      int i =1;
      for (var brand in brandsCategory) {
        // Get ImageData link from the local assets

        // brand.image="https://firebasestorage.googleapis.com/v0/b/tinder-c2ca6.firebasestorage.app/o/Products%2FImages%2Fassets%2Fimages%2Fbanners%2Fpromo-banner-2.png?alt=media&token=89376112-ff6a-44b1-8f93-3a4de8f1fff5";
        // Store Category in Firestore
        await _db.collection ("BrandCategory").doc (i.toString()).set (brand.toJson ());
        i++;
        

      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException (e.code) .message;
    } catch(e)
    {
      throw 'Something went wrong. Please try again';

    }
  }
}
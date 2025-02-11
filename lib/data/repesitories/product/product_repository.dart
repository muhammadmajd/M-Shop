
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tinder/features/shop/models/product_category_model.dart';
import 'package:tinder/features/shop/screens/product_details/widgets/product_meta_data.dart';

import '../../../features/shop/models/category_model.dart';
import '../../../features/shop/models/product_model.dart';
import '../../../utils/constents/enums.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/firebase_storage_service.dart';

class ProductRepository extends GetxController
{
  static ProductRepository get instance => Get.find();
  /// Firestore instance for database interactions.
  final _db = FirebaseFirestore. instance;
  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try{
      //final snapshot = await _db.collection ('Products'). limit (4).get();
      final snapshot =  await _db.collection ('Products') .where ('IsFeatured', isEqualTo: true). limit (4) .get() ;

      return snapshot.docs.map((e)=> ProductModel.fromSnapshot(e)).toList();

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch(e)
    {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get all featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try{
      final snapshot = await _db.collection ('Products') .where ('IsFeatured', isEqualTo: true).get() ;
      //_db.collection ('Products').get();
      return snapshot.docs.map((e)=> ProductModel.fromSnapshot(e)).toList();

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch(e)
    {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get   products based on Query
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try{
          final querySnapshot = await query.get() ;
          final List<ProductModel> productList = querySnapshot.docs.map ((doc) =>ProductModel.fromQuerySnapshot(doc)) .toList ();
          return productList;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch(e)
    {
      throw 'Something went wrong. Please try again';
    }
  }
  /// Get Products based on the Query
  Future<List<ProductModel>> getFavouriteProducts (List<String> productIds) async {
    try{
      final snapshot = await
      _db.collection('Products') .where (FieldPath. documentId, whereIn: productIds).get () ;
      return snapshot.docs.map ((querySnapshot) => ProductModel.fromSnapshot (querySnapshot)) .toList();

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch(e)
    {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get   products based on Brand

  Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {
    try{
      final querySnapshot = limit == -1
          ? await _db.collection('Products').where ('Brand.Id', isEqualTo: brandId).get ()
      :await _db. collection ('Products').where ('Brand.Id', isEqualTo: brandId).limit (limit).get ();

      final products = querySnapshot .docs.map((doc) => ProductModel.fromSnapshot (doc)) .toList();
      return products;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
    }catch (e) {
      throw 'Something went wrong. Please try again';
    }

  }

  /// Get   products based on Category

  Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = -1}) async {
    try{
    // Query to get all documents where productId matches the provided categoryId & Fetch limited or unlimited based on limit
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db.collection('ProductCategory') .where ('categoryId', isEqualTo: categoryId) . get ()
          :await _db.collection('ProductCategory').where ('categoryId', isEqualTo: categoryId) .limit(limit).get();
      // Extract productIds from the documents
      List<String> productIds = productCategoryQuery. docs.map ((doc) => doc[ 'productId'] as String) .toList();
      // Query to get all documents where the brandId is in the list of brandIds, FieldPath. documentId to query documents in Collection
      final productsQuery = await  _db.collection ('Products').where (FieldPath.documentId, whereIn: productIds) .get();
      // Extract brand names or other relevant data from the documents
      List<ProductModel> products = productsQuery. docs. map ((doc) => ProductModel.fromSnapshot (doc)) . toList();
      return products;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e) {
      throw 'Something went wrong. Please try again';
    }

  }




  /// Upload dummy data to the Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try{
    // Upload all the products along with their images
    final storage = Get.put(TFirebaseStorageService()) ;
    // Loop through each product
    for (var product in products) {
      // Get image data link from local assets
      final thumbnail = await storage.getImageDataFromAssets(product. thumbnail);
      // Upload image and get its URL
      final url = await storage.uploadImageData ('Products/Images', thumbnail, product. thumbnail. toString());
      // Assign URL to product. thumbnail attribute
      product. thumbnail = url;

      // Product list of images
      if (product. images != null && product. images!.isNotEmpty) {
        List<String> imagesUrl = [];
        for (var image in product.images!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets (image);
            // Upload image and get its URL
            final ur = await storage.uploadImageData('Products/Images', assetImage, image);
            // Assign URL to product. thumbnail attribute
            imagesUrl.add (url);

        }
        product.images!.clear();
        product.images!.addAll(imagesUrl);
      }

      // Upload Variation Images
      if (product.productType == ProductType.variable .toString())
      {
        for (var variation in product.productVariations!) {
          // Get image data link from local assets
          final assetImage = await storage.getImageDataFromAssets(
              variation.image);
          // Upload image and get its URL
          final url = await storage.uploadImageData(
              'Products/Images', assetImage, variation.image);
          // Assign URL to variation. image attribute
          variation.image = url;
        }
      }
    // Store product in Firestore
    await _db.collection("Products") .doc (product.id) .set (product. toJson ()) ;

    }

    } on FirebaseException catch (e) {
      throw e.message!;
    } /*on SocketException catch (e) {
    throw e.message;
    } */on PlatformException catch (e) {
      throw e.message!;
    } catch(e)
    {
      throw e. toString();

    }
  }
  /// Upload dummy product_category to the Cloud Firebase
  Future<void> uploadProductCategoryDummyData(List<ProductCategoryModel> products) async {
    try{
      // Loop through each category
      int i =1;
      for (var brand in products) {
        // Get ImageData link from the local assets

        // brand.image="https://firebasestorage.googleapis.com/v0/b/tinder-c2ca6.firebasestorage.app/o/Products%2FImages%2Fassets%2Fimages%2Fbanners%2Fpromo-banner-2.png?alt=media&token=89376112-ff6a-44b1-8f93-3a4de8f1fff5";
        // Store Category in Firestore
        await _db.collection("ProductCategory").doc(i.toString()).set(
            brand.toJson());
        i++;
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } /*on SocketException catch (e) {
    throw e.message;
    } */on PlatformException catch (e) {
      throw e.message!;
    } catch(e)
    {
      throw e. toString();

    }
  }
}